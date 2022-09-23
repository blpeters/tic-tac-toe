# frozen_string_literal: true

class TicTacToe
  attr_accessor :square_values, :winner, :player1, :player2

  # TODO: when a new instance of Board is created, a new board needs to be
  # displayed and a new board array with 9 slots needs to be created.
  def initialize(player1, player2)
    @square_values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1 = player1
    @player2 = player2
    @p1score = player1.score
    @p2score = player2.score
    @game_over = false
    play(player1, player2)
  end

  private

  def display
    # TODO: look further into Ruby HEREDOCS
    puts <<~BOARD
      \n
      #{square_values[0]} | #{square_values[1]} | #{square_values[2]}
      ----------
      #{square_values[3]} | #{square_values[4]} | #{square_values[5]}
      ----------
      #{square_values[6]} | #{square_values[7]} | #{square_values[8]}\n\n
    BOARD
  end

  def play(first, second)
    @game_over = false
    @square_values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    current_player = first
    available_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    until @game_over
      display
      print "#{current_player.name}, Select Your square from the following available squares: #{available_squares}: "
      selection = gets.chomp.to_i
      # TODO: Don't allow players to select a taken square.
      available_squares.delete(selection)
      declare_tie if available_squares.length == 0
      update(current_player.marker, selection)
      check_winner(current_player)
      current_player = current_player == first ? second : first
      # winner = true
    end
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
        play(player1, player2)
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
    display
    @game_over = true
    puts "TIE GAME - NOBODY WINS\n\n"
    show_score
    replay
  end

  def declare_winner(player)
    display
    puts "#{player.name.upcase} is the Winner!\n\n"
    player.score += 1
    show_score
    replay
  end

  def check_winner(player)
    if check_column_winner(player) || check_row_winner(player) || check_diagonal_winner(player)
      @game_over = true
      declare_winner(player)
    end
  end

  def check_column_winner(player)
    col_1 = [square_values[0], square_values[3], square_values[6]]
    col_2 = [square_values[1], square_values[4], square_values[7]]
    col_3 = [square_values[2], square_values[5], square_values[8]]
    return true if col_1.all?(player.marker) || col_2.all?(player.marker) || col_3.all?(player.marker)

    false
  end

  def check_row_winner(player)
    row_1 = [square_values[0], square_values[1], square_values[2]]
    row_2 = [square_values[3], square_values[4], square_values[5]]
    row_3 = [square_values[6], square_values[7], square_values[8]]
    return true if row_1.all?(player.marker) || row_2.all?(player.marker) || row_3.all?(player.marker)

    false
  end

  def check_diagonal_winner(player)
    diag_1 = [square_values[0], square_values[4], square_values[8]]
    diag_2 = [square_values[6], square_values[4], square_values[2]]
    return true if diag_1.all?(player.marker) || diag_2.all?(player.marker)

    false
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
  attr_accessor :name, :player_num, :marker, :score

  def initialize(number)
    @player_num = number
    puts "Please enter Player #{number}\'s name:"
    @name = gets.chomp.upcase
    puts "#{self.name}, please enter what letter you would like to use as a marker:"
    @marker = gets.chomp.upcase
    @score = 0
  end
end

player1 = Player.new(1)
player2 = Player.new(2)
TicTacToe.new(player1, player2)
