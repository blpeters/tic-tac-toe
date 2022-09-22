# frozen_string_literal: true

# Tic Tac Toe Board display to console, including completed moves.
# This class only displays and updates the display of the board
# This class does not initiate any changes or declare any winners!
class Board
  # TODO: when a new instance of Board is created, a new board needs to be
  # displayed and a new board array with 9 slots needs to be created.
  def display
    puts <<~BOARD.strip
      1 | 2 | 3
      ----------
      4 | 5 | 6
      ----------
      7 | 8 | 9
    BOARD
  end

  # An update method will take in parameters for which player (or symbol) and
  # what location (square) on the board needs updating and update that location
  # in the array.
  def update(symbol, location)
    puts symbol
    puts location
  end
end

tic_tac_toe_board = Board.new
tic_tac_toe_board.display
tic_tac_toe_board.update('X', '2')
