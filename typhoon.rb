require 'pry'

class Cards
  attr_reader :deck

  def initialize(selected_num)
    @deck = create_cards(selected_num)
  end

  def create_cards(choice)
    deck = []
    # puts "Choose an option => 1: Basic cards  -  2: Custom cards"
    # choice = gets.chomp.to_i

    if choice == '1'
      ['num', 'special', 'special2', 'typhoon'].each do |type|
        deck << select_cards(type)
      end
    else
      ['num', 'special', 'special2', 'typhoon'].each do |type|
        deck << select_cards_custom(type)
      end
    end
    deck.flatten.shuffle
  end

  def select_cards(type)
    types = card_types
    case type
    when 'num'
      types[0]
    when 'special'
      types[1]
    when 'special2'
      types[2]
    when 'typhoon'
      types[3]
    end
  end

  def select_cards_custom(type)
    types = card_types
    case type
    when 'num'
      selected = []
      12.downto(1) do |n|
        puts "Please enter 12 numbers between -30 & 250. \nOnly numbers that are multiples of '10'"
        puts "Current numbers: #{selected}"
        puts "Remaining numbers: #{n}"
        selected << gets.chomp
      end
      selected
    when 'special'
      options = types[1]
      selected = []
      8.downto(1) do |n|
        puts "Please select special cards. \nOnly 8 are allowed"
        puts "Current selected: #{selected}"
        puts "Options: #{types[1]}"
        puts "Input:"
        input = gets.chomp
        options.each do |name|
          if name.include?(input)
            selected << name
            break
          end
        end
      end
      selected
    when 'special2'
      options = types[2]
      selected = []
      5.downto(1) do |n|
        puts "Please select special cards. \nOnly 5 are allowed"
        puts "Current selected: #{selected}"
        puts "Options: #{types[2]}"
        puts "Input:"
        input = ''
        loop do
          input = gets.chomp
          break if options.any?{ |n| n.include?(input) }
          puts "Please enter a valid name."
        end
        options.each do |name|
          if name.include?(input)
            selected << name
            break
          end
        end
      end
      selected
    when 'typhoon'
      types[3]
    end
  end

  def card_types
    special = ['shinobi', 'shinobi-half', 'shinobi', 'bomb', 'present bomb', 'present bomb', 'safe', 'safe']
    numbers = [100, 140, 250, 120, 50, 200, 70, -10, -30, 140, 200]
    typhoon = ['typhoon']
    special2 = ['chance', 'chance', 'time-trial', 'time-trial', 'restore']
    [numbers, special, special2, typhoon]
  end
end

class Board
  attr_reader :squares
  def initialize(selected_num)
    @cards = Cards.new(selected_num).deck
    @squares = create_board
  end

  def create_board
    create_empty_board # creates empty squares (25)
  end

  def display
    squares
  end

  def choose_square(input)
    # puts "Select a card from 1-25"
    # input = gets.chomp.to_i - 1
    # if input > 25 || input < 0 || get_value_from_square(input) == 'empty'
    #   puts "Error: Please enter a number beteen 1 and 25."
    #   choose_square
    # end
    value = get_value_from_square(input)
    remove_square(input)
    value
  end


private

  def get_value_from_square(sqr_num)
    squares[sqr_num]
  end

  def remove_square(sqr_num)
    @squares[sqr_num] = 'empty'
  end

  def create_empty_board
    squares = (1..25).to_a.each { |n| n }
    populate_board_with_cards(squares) # adds a card to each space randomly
  end

  def populate_board_with_cards(empty_board)
    new_board = []
    available_cards = @cards
    empty_board.each do |square|
      new_board << available_cards.shuffle!.pop.to_s
    end
    new_board
  end
end

class Game
  attr_reader :started, :board, :last_selected_card

  def initialize(selected_num = '1')
    @board = Board.new(selected_num)
    @started = "\nRUNNING\n\n"
  end

  def play
    started
    puts select_card
  end

  def select_card(num)
    @last_selected_card = @board.choose_square(num)
  end
end

#
# game = Game.new
# p game.board.display
# game.play
# p game.board.display
# game.play
# p game.board.display
# game.play
# p game.board.display
