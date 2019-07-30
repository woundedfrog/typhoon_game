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

# def start_game
#   # selected_option = params[:option_number]
#   #  game = Game.new(selected_option)
#   # @board = game
#   erb :new_game
# end

helpers do
  def test_if_num(value)
    return true if value.to_i.to_s == value
  end

  def get_value_for_square(square_n)

    selected = GAME.select_card(square_n)
    @last_card = GAME.last_selected_card
    selected
  end
end

get '/start' do
  # GAME = start_game

  erb :new_game
  # redirect '/'
end

get '/' do
  redirect '/start' unless defined? GAME
  @game = GAME.board.display
  last = GAME.last_selected_card
  @last_card = last.nil? ? 'typhoon_bg' : last
  @current_board = GAME.board.current_board
  erb :home
end

post '/select_square/:square' do

  GAME.select_card(params[:square].to_i - 1)
  # binding.pry
  @last_card = GAME.last_selected_card

  redirect '/'
end


post '/create_new_game' do
    selected_option = params[:option_number].to_s
     game = Game.new(selected_option)
     GAME = game
     redirect '/'
end
