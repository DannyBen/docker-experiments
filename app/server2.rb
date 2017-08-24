require 'sinatra'
require 'open-uri'

set port: ENV['PORT']
set bind: '0.0.0.0'

mkdir '/data' unless Dir.exist? '/data'
File.write '/data/sample.txt', 'tada!'

get '/' do
  'OK'
end

get '/test' do
  (file_found? ? "[PASS]" : "[FAIL]") + " Test 1/1: /data file exists"
end

def file_found?
  File.exist? '/data/sample.txt'
end
