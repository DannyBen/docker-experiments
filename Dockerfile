FROM alpine:3.14
RUN apk --no-cache add ruby
RUN gem install bundler
