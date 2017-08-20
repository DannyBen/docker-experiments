require 'sinatra'
require 'open-uri'
require "sinatra/reloader" if development?

set port: ENV['PORT']
set bind: '0.0.0.0'

before do
  content_type 'text/plain'
end

get '/' do
  'Server 1 running. Go to /test to show data from server 2'
end

get '/test' do
  result = ["Test 1/2: HTTP connection to server2:"]
  result << (http_connected? ? "PASS" : "FAIL")
  result << "Test 2/2: Volume from server2:"
  result << (file_found? ? "PASS" : "FAIL")
  result.join "\n"
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
