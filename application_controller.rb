require 'dotenv/load'
require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end
  post '/result' do
    user_input= params[:topic]  
    @final= get_pic(user_input)
    erb :result
  end
end
