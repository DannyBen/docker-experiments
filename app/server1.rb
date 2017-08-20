require 'sinatra'
require 'open-uri'

set port: ENV['PORT']
set bind: '0.0.0.0'

before do
  content_type 'text/plain'
end

get '/' do
  'Server 1 running. Go to /test to show data from server 2'
end

get '/test' do
  open(ENV['SERVER2_URL']).read
end

get '/env' do
  ENV.map { |k,v| "#{k}=#{v}\n" }.join
end