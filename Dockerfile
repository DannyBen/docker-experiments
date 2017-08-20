FROM dannyben/alpine-ruby

ENV PS1 "\n\ndocker:experiments \W \$ "

RUN apk --no-cache add bash

WORKDIR /app
COPY app/Gemfile* ./
RUN bundle

COPY app /app/

EXPOSE 3000 4000