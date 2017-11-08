require 'open-uri'

result = open(ENV['SERVER2_URL']).read
code = result == "OK" ? 0 : 1
puts result
exit code