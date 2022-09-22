# frozen_string_literal: true

# Tic Tac Toe Board display to console, including completed moves.
class TicTacToe
  attr_accessor :square_values
  
  # TODO: when a new instance of Board is created, a new board needs to be
  # displayed and a new board array with 9 slots needs to be created.
  def initialize
    @square_values = ['X', 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    # TODO: look further into Ruby HEREDOCS
    puts <<~BOARD
      #{square_values[0]} | #{square_values[1]} | #{square_values[2]}
      ----------
      #{square_values[3]} | #{square_values[4]} | #{square_values[5]}
      ----------
      #{square_values[6]} | #{square_values[7]} | #{square_values[8]}\n\n
    BOARD
  end

  # The update method will take in parameters for the current player's symbol and
  # what location (square) was chosen by the player and update that location
  # in the array.
  def update(symbol, location)
    square_values[location - 1] = symbol
    display
  end
end

class Player
  def initialize(number)
    @player_num = number
  end
end

player1 = Player.new(1)
player2 = Player.new(2)
tic_tac_toe = TicTacToe.new
tic_tac_toe.update('X', 2)