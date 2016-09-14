require_relative 'board'

class Game
    attr_accessor :board
    
    def initialize
        @game_over = false
        @board = Board.new
        @board.show_board
        round
    end
    
    def round
        @white = 'white'
        @black = 'black'
        @players = [@white, @black]
        
        while @game_over == false
            @players.each do |player|
                puts "#{player} player's turn".upcase
                @board.select_piece(player)
            end
        end
    end
end

game = Game.new