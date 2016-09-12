require_relative 'board'
require_relative 'player'

class Game
    attr_accessor :white, :black, :board
    
    def initialize
        @white = Player.new('white')
        @black = Player.new('black')
        @board = Board.new
        
        @board.show_board
    end

end

game = Game.new