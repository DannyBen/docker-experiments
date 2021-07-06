FROM alpine:3.14

WORKDIR /app

RUN apk --no-cache add \
    ruby-dev \
    build-base \
    ruby \
    ruby-io-console \
    libffi-dev \
    zlib-dev

RUN gem install bundler

RUN bundle config --global silence_root_warning 1

RUN gem install sinatra


