# module to hold methods needed for the game
module Toolbox
  # method for converting number code into color
  # I think this can be done through an array of colors and use
  # the index to map out conversion, but this looks more clear
  # to me. Probably not best practice...
  def converter(code)
    case code
    when 0
      "red"
    when 1
      "green"
    when 2
      "blue"
    when 3
      "yellow"
    when 4
      "brown"
    when 5
      "orange"
    when 6
      "black"
    when 7
      "white"
    end
  end

  # sends each code to be converted from number to color
  def convert_to_color!(code_in_numbers)
    code_in_numbers.each_with_index do |n, i|
      code_in_numbers[i] = converter(n)
    end
  end
end

class Player
  include Toolbox
  attr_accessor :code_guess

  def initialize()
  end

  def output_guess
    p guess_converter
  end

  private

  # sends the integer guess array to be converted to color
  def guess_converter
    convert_to_color!(convert_player_guess)
  end

  # returns the result from: player guess to array => string in array to integer
  def convert_player_guess
    string_to_i!(player_guess_to_array)
  end

  # splits the player guess string to arrays
  def player_guess_to_array
    @code_guess.split(" ")
  end

  # does the changing of changing string to integer
  def string_to_i!(code_array)
    code_array.each_with_index do |n, i|
      code_array[i] = n.to_i
    end
  end
end

class Mastermind
  include Toolbox
  @@player = Player.new
  @@board = ["0,1,2,3,4,5,6,7"]
  @@code = []
  @@guesses = {
    big_correct: 0,
    small_correct: 0,
    no_correct: 0
  }
  @@win = false
  @@guess_count = 0

  def initialize(size)
    @size = size
  end

  def player_guess
    @@player.code_guess = gets.chomp
  end

  def play
    game_set
    until @@win do
      @@guess_count+=1
      print "Try #{@@guess_count}: "
      player_guess
      play = @@player.output_guess
      puts "Player guess: #{play} | Computer code: #{@@code}"

      # win condition
      if play.eql?(@@code) 
        puts "You win! The code was #{@@code}."
        @@win = true
      elsif @@guess_count == 8
        puts "You lose! The code was #{@@code}."
      end
    end
  end

  # sets the game; scramble the board to set the code and cut it to size.
  def game_set
    @@code = scramble_board.slice(0, @size)
    convert_to_color!(@@code)
  end

  private

  # just scrambles the board
  def scramble_board
    @@board.shuffle
  end
end

game = Mastermind.new(4)

game.play