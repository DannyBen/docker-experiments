FROM ruby:3-alpine

ENV PACKAGES build-base
# ENV PACKAGES bash curl curl-dev ruby-dev build-base
# ENV RUBY_PACKAGES \
#   ruby ruby-io-console ruby-irb \
#   ruby-json ruby-etc ruby-bigdecimal ruby-rdoc \
#   libffi-dev zlib-dev
ENV TERM=linux
ENV PS1 "\n\n>> ruby \W \$ "

RUN apk --no-cache add $PACKAGES

RUN echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler

RUN bundle config --global silence_root_warning 1

RUN gem install redirectly

WORKDIR /app

ENTRYPOINT ["redirectly"]