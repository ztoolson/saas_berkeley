require 'sinatra'

class Hello < Sinatra::Base
  get '/' do
    'goodbye!'
  end
end
