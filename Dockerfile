FROM ruby:2.7.2

WORKDIR /workspace

RUN apt update \
  && apt install python3-pip -y \
  && python3 -m pip install awscli awscli-local

COPY Gemfile ./

RUN bundle install

COPY . /