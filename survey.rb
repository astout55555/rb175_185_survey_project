require "sinatra"
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"
require "psych"
require "bcrypt"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
  set :erb, :escape_html => true
end

configure(:development) do
  require "sinatra/reloader"
end

not_found do
  status 404
  erb :not_found
end

# `__FILE__` refers to the current file (`survey.rb`)
# method provides absolute path from root to parent of current file
def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__) # then adds `/test/data`
  else
    File.expand_path("../data", __FILE__) # or just `/data`
  end
end

def credentials_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/admins.yml", __FILE__)
  else
    File.expand_path("../admins.yml", __FILE__)
  end
end

# relative paths are based on where the program is called from...
# so instead we need absolute paths based on the location of the file itself

helpers do

end

before do

end

after do

end

get "/" do
  redirect "/survey"
end

get "/survey" do

end
