class Mastermind
  @@board = [0,1,2,3,4,5,6,7]
  @@board_scrambled = Array.new()

  def game_set
    @@board_scrambled = scramble_board()
  end

  private
  def scramble_board
    @@board.shuffle
  end
end

game = Mastermind.new()

p game.game_set