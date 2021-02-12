FROM ruby:2.7.2-slim@sha256:84d1cc2a61a5c8ad7c6ebbe8e6eedc3e6c8999f0c9d4c0b165ee65d3c6c7187a AS dev

RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev
