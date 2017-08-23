require 'sinatra'
require 'open-uri'
require "sinatra/reloader" if development?

set port: ENV['PORT']
set bind: '0.0.0.0'

before do
  content_type 'text/plain'
end

get '/' do
  [
    "Server 1",
    "Hostname: #{ENV['HOSTNAME']}",
    "See also: /test and /env"
  ].join "\n"
end

get '/test' do
  [
    (http_connected? ? "[PASS]" : "[FAIL]") + " Test 1/2: HTTP connection to server2",
    (file_found?     ? "[PASS]" : "[FAIL]") + " Test 2/2: Volume from server2",
  ].join "\n"
end

get '/env' do
  ENV.map { |k,v| "#{k}=#{v}\n" }.join
end

def file_found?
  File.exist? '/data/sample.txt'
end

def http_connected?
  open(ENV['SERVER2_URL']).read == 'OK'
end
