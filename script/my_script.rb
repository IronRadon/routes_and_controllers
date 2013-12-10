require 'rest-client'
require 'addressable/uri'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/2'
).to_s

p url



p RestClient.put(url, {:user => {:name => "Dan2.0", :email => "d@d.com" }})
