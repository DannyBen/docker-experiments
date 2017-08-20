FROM dannyben/alpine-ruby

ARG build_name

ENV PS1 "\n\n>> experiments \W \$ "

RUN apk --no-cache add bash

WORKDIR /app
COPY app/Gemfile* ./
RUN bundle

COPY app ./
RUN run setup $build_name

EXPOSE 3000 4000