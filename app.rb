require 'sinatra'
require 'sinatra/reloader'
require_relative './config'
require 'maxminddb'
require 'erubis'
set :erb, :escape_html => true

db = MaxMindDB.new('./GeoLite2-City_20220222/GeoLite2-City.mmdb')

get '/' do
  erb :index
end

post '/' do
  host = params['host']
  @ip = IPSocket::getaddress(host)
  @geo = db.lookup(@ip)
  @GOOGLE_API_KEY = GOOGLE_API_KEY
  erb :index
end
