# frozen_string_literal: true

# Choose randomly between two options. In this case, choose who starts the game.
module CoinFlip
  def coin_flip(first_value, second_value)
    arr = [first_value, second_value]
    arr.sample
  end
end

class Board
  attr_accessor :square_values

  def initialize
    @square_values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display
    puts <<~BOARD
    \n
    #{square_values[0]} | #{square_values[1]} | #{square_values[2]}
    ----------
    #{square_values[3]} | #{square_values[4]} | #{square_values[5]}
    ----------
    #{square_values[6]} | #{square_values[7]} | #{square_values[8]}\n\n
  BOARD
  end

  def update(symbol, index)
    square_values[index - 1] = symbol
  end

  def winner?(player)
    check_column_winner(player) || check_row_winner(player) || check_diagonal_winner(player)
  end

  private
  
  def check_column_winner(player)
    col1 = [square_values[0], square_values[3], square_values[6]]
    col2 = [square_values[1], square_values[4], square_values[7]]
    col3 = [square_values[2], square_values[5], square_values[8]]
    return true if col1.all?(player.marker) || col2.all?(player.marker) || col3.all?(player.marker)

    false
  end

  def check_row_winner(player)
    row1 = [square_values[0], square_values[1], square_values[2]]
    row2 = [square_values[3], square_values[4], square_values[5]]
    row3 = [square_values[6], square_values[7], square_values[8]]
    return true if row1.all?(player.marker) || row2.all?(player.marker) || row3.all?(player.marker)

    false
  end

  def check_diagonal_winner(player)
    diag1 = [square_values[0], square_values[4], square_values[8]]
    diag2 = [square_values[6], square_values[4], square_values[2]]
    return true if diag1.all?(player.marker) || diag2.all?(player.marker)

    false
  end
end

# Runs one instance of the tic tac toe game between two instances of the player class.
class TicTacToe
  include CoinFlip

  attr_reader :board
  attr_accessor :square_values, :winner, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @p1score = player1.score
    @p2score = player2.score
    @game_over = false
  end

  def play
    @game_over = false
    @board = Board.new
    current_player = coin_flip(player1, player2)
    @available_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    puts "#{current_player.name} will go first this round....\n"
    until @game_over
      board.display
      selected_square = select_square(current_player)
      board.update(current_player.marker, selected_square)
      declare_winner(current_player) if board.winner?(current_player)
      declare_tie if @available_squares.empty?
      current_player = current_player == player1 ? player2 : player1
    end
  end

  def select_square(player)
    print "#{player.name}, Select Your square from the following available squares #{@available_squares}: "
    selection = gets.chomp.to_i
    until @available_squares.include?(selection)
      print "Invalid square. Please choose from the available squares #{@available_squares}: "
      selection = gets.chomp.to_i
    end
    @available_squares.delete(selection)
    selection
  end

  def show_score
    puts 'GAMES WON:'
    puts "#{@player1.name.upcase}: #{@player1.score}"
    puts "#{@player2.name.upcase}: #{@player2.score}\n\n"
  end

  def replay
    done = false
    until done
      print 'Do you want to play again? (y/n): '
      answer = gets.chomp.strip.upcase
      if answer == 'Y'
        play
        done = true
      elsif answer == 'N'
        puts 'Okay, bye!'
        done = true
        exit
      else
        puts 'Invalid input.'
      end
    end
  end

  def declare_tie
    board.display
    @game_over = true
    puts "TIE GAME - NOBODY WINS\n\n"
    show_score
    replay
  end

  def declare_winner(player)
    @game_over = true
    board.display
    puts "#{player.name.upcase} is the Winner!\n\n"
    player.score += 1
    show_score
    replay
  end
end

# Sets up the name and symbol each player would like to use during the game by getting input from the two users.
class Player
  attr_accessor :name, :player_num, :marker, :score

  def initialize(number)
    @player_num = number
    puts "Please enter Player #{number}\'s name:"
    @name = gets.chomp.upcase
    puts "#{name}, please enter what letter you would like to use as a marker:"
    input = gets.chomp.upcase
    until input.length == 1 && input.match(/[A-Z]/)
      print 'invalid marker. Please choose a single alphabetical character: '
      input = gets.chomp.upcase
    end
    @marker = input
    @score = 0
  end
end

game = TicTacToe.new
game.play

