require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'
require 'fileutils'
require 'pry'

require './typhoon'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

# GAME = start_game

def start_game
   game = Game.new
  @board = game
end

get '/start' do
  GAME = start_game
  redirect '/'
end

get '/' do
  redirect '/start' unless defined? GAME
  @game = GAME.board.display
  @last_card = GAME.last_selected_card
  erb :home
end

post '/select_square' do
# binding.pry
  GAME.select_card(params[:square_num].to_i - 1)
  redirect '/'
end