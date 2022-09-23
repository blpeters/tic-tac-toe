# frozen_string_literal: true

# Tic Tac Toe Board display to console, including completed moves.
class TicTacToe
  attr_accessor :square_values, :winner

  @@score = [0, 0]

  # TODO: when a new instance of Board is created, a new board needs to be
  # displayed and a new board array with 9 slots needs to be created.
  def initialize(player1, player2)
    @square_values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1 = player1
    @player2 = player2
    @winner = false
    play(player1, player2)
  end

  private

  def display
    # TODO: look further into Ruby HEREDOCS
    # TODO: Add a header above each board that shows who's playing vs. who and how many games they've won.
    puts <<~BOARD
      #{square_values[0]} | #{square_values[1]} | #{square_values[2]}
      ----------
      #{square_values[3]} | #{square_values[4]} | #{square_values[5]}
      ----------
      #{square_values[6]} | #{square_values[7]} | #{square_values[8]}\n\n
    BOARD
  end

  def play(first, second)
    current_player = first
    available_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    until @winner do
      display
      print "#{current_player.name}, Select Your Square from the following available squares: #{available_squares}: "
      selection = gets.chomp.to_i
      available_squares.delete(selection)
      update(current_player.marker, selection)
      check_winner(current_player)
      current_player == first ? current_player = second : current_player = first
      # winner = true
    end
  end

  def check_winner(player)
    if check_column_winner || check_row_winner || check_diagonal_winner
      @winner = true
      puts "#{player.name} is the Winner!"
      # TODO: declare the winner and display the scores. Probably in another method or 2
    end
  end

  def check_column_winner
    return true
  end

  def check_row_winner

  end

  def check_diagonal_winner

  end

  # The update method will take in parameters for the current player's symbol and
  # what location (square) was chosen by the player and update that location
  # in the array.
  def update(symbol, location)
    square_values[location - 1] = symbol
  end
end

# Sets up the name and symbol each player would like to use during the game by getting input from the two users.
class Player
  attr_accessor :name, :player_num, :marker

  def initialize(number)
    @player_num = number
    puts "Please enter Player #{number}\'s name:"
    @name = gets.chomp
    puts "#{self.player_num}, please enter what letter you would like to use as a marker:"
    @marker = gets.chomp
  end
end

player1 = Player.new(1)
player2 = Player.new(2)
TicTacToe.new(player1, player2)
