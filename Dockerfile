FROM ruby:2.6.3-slim@sha256:88a593973b9c914d77902268af8290a37ee4dcbc3577ceb7b7cf2acb1ff48bc8 AS dev

RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev
