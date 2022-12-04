module Toolbox
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

end

class Mastermind
  @@board = [0,1,2,3,4,5,6,7]
  @@code = Array.new()

  def initialize(size)
    @size = size
  end

  def game_set
    @@code = scramble_board().slice(0, @size)
  end

  private
  def scramble_board
    @@board.shuffle
  end
end

game = Mastermind.new(4)

p game.game_set