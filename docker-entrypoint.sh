#!/bin/bash

set -Eeuo pipefail

bundle check || { gem install bundler:2.2.9 && bundle install --jobs=100; }

exec "${@-bash}"
