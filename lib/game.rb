require_relative 'board'

class Game
    attr_accessor :white, :black, :board
    
    def initialize
        @board = Board.new
        @board.show_board
    end

end

game = Game.new