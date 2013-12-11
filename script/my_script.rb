require 'rest-client'
require 'addressable/uri'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/group_memberships/7'
).to_s


p RestClient.delete(url)

