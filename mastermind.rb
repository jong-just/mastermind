
class Player
  attr_accessor :code_guess

  def initialize()
  end

  def output_guess
    p player_guess_to_array
  end

  private


  # splits the player guess string to arrays
  def player_guess_to_array
    @code_guess.split(" ")
  end
end

class Mastermind
  @@player = Player.new
  @@board = ["red", "green", "blue", "yellow", "brown", "orange", "black", "white"]
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
      puts "Player guess: #{play.join(", ")} | Computer code: #{@@code.join(", ")}"

      # win condition
      if play.eql?(@@code) 
        puts "You win! The code was: #{@@code.join(", ")}."
        @@win = true
      elsif @@guess_count == 8
        puts "You lose! The code was: #{@@code.join(", ")}."
      end
    end
  end

  # sets the game; scramble the board to set the code and cut it to size.
  def game_set
    @@code = scramble_board.slice(0, @size)
  end

  private

  # just scrambles the board
  def scramble_board
    @@board.shuffle
  end
end

game = Mastermind.new(4)

game.play