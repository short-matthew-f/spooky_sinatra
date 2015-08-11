require 'bundler'
Bundler.require

require 'json'

get '/' do
  @users = JSON.parse(File.read("./data/users.json"))

  erb :index
end
