FROM dannyben/alpine-ruby

ENV PS1 "\n\ndocker:connectivity \W \$ "

RUN apk --no-cache add bash

WORKDIR /tmp
COPY app/Gemfile* /tmp/
RUN bundle

WORKDIR /app
COPY app /app/

EXPOSE 3000 4000