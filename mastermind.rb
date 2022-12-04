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

class Mastermind
  include Toolbox

  @@board = [0,1,2,3,4,5,6,7]
  @@code = Array.new

  def initialize(size)
    @size = size
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

p game.game_set