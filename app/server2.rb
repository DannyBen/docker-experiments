require 'sinatra'
require 'open-uri'

set port: ENV['PORT']
set bind: '0.0.0.0'

get '/' do
  'Server 2 reporting.'
end
