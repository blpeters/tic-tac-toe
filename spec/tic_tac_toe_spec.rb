# frozen_string_literal: true

require_relative '../tic_tac_toe.rb'

# TEST PSEUDOCODE AND NOTES

# If refactoring with additional methods, WRITE TESTS FIRST - red/green refactor this.
# Check out spec exercise 13 from TOP - has the initialize method.
# try ChatGPT to help explain things like dependency injection, etc.


# TicTacToe class

# Per TOP, need to test that the win conditions are activated correctly. For example,
# when there is three in a row in any direction, the #game_over win method is called correctly.

# test each critical method, making sure that they function properly and handle edge cases

# Use mocks/doubles to isolate methods and make sure they are sending back the right outputs

# Use a context block to make your tests clear and well organized.
# It is not required, but it is generally used to explain any conditionals.
# Here are some examples of words you should start your context block with:
# if, when, unless, with, without, for, before, after, during

# describe -> Name of the method that is being tested.
# context ->  Explains the conditions of the test.
# it ->       Explains the results of the test.

describe TicTacToe do

  let(:player1) { double('player1', score: 0, marker: 'X', player_num: 1, name: 'Brett') }
  let(:player2) { double('player2', score: 0, marker: 'O', player_num: 2, name: 'Karen') }
  subject(:game) { described_class.new(player1, player2) }

  describe '#initialize' do
    context 'when a new game is initialized' do

      it 'has player 1 with no score' do
        expect(player1.score).to eq(0)
      end

      it 'has player 2 with no score' do
        expect(player2.score).to eq(0)
      end
      
    end
  end

  describe '#display' do
    context 'when given an array with status of squares'
      it 'shows the correct board for the start of a game'
      square_values = [0,1,2,3,4,5,6,7,8]
      

      do
    do

  end
end