#!/bin/bash

set -Eeuo pipefail

source=${1-Gemfile}

check() {
  if wc -c destination | grep -E '^0 ' > /dev/null; then
    echo 'Copy failed'
  else
    echo OK
  fi
  echo
}

printf "FROM debian:10.8-slim\nRUN apt update && apt install -y gcc strace" > /tmp/strace_Dockerfile
docker build -f /tmp/strace_Dockerfile -t strace .
echo

echo Local:
(
  # set -x
  gcc test.c
  strace ./a.out "$source" &> test-strace
)
check

echo Docker - mounted:
docker run --rm -v "$(pwd):/work" -w /work strace bash -c "
  #set -x &&
  gcc test.c &&
  strace ./a.out '$source' &> test-strace-docker-mounted
"
check

echo Docker - copied:
docker run --rm -v "$(pwd):/work" -w /work strace bash -c "
  #set -x &&
  cp '$source' /x &&
  gcc test.c &&
  strace ./a.out /x &> test-strace-docker-copied
"
check
