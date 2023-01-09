# frozen_string_literal: true

# TEST PSEUDOCODE AND NOTES

# coinflip MODULE

# method #coinflip (incoming Query - assert result) should return either the first or second argument only.
# given a and b as args, test for either a or b only is returned. 
# TO DO - should this method be tested from inside the tic tac toe class where it is called?
# review the notes from TOP.


# Player class

# currenyly only has an initialize method - look at TOP notes about testing this or pulling out separate methods
# If refactoring with additional methods, WRITE TESTS FIRST - red/green refactor this.
# Check out spec exercise 13 from TOP - has the initialize method.
# try ChatGPT to help explain things like dependency injection, etc.


# TicTacToe class

# Per TOP, need t test that the win conditions are activated correctly. For example,
# when there is three in a row in any direction, the #game_over win method is called correctly.

# test each critical method, making sure that they function properly and handle edge cases

# Use mocks/doubles to isolate methods and make sure they are sending back the right outputs