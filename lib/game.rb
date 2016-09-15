require_relative 'board'

class Game
    attr_accessor :board
    
    def initialize
        @game_over = false
        @board = Board.new
        puts "Let's play a game..."
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
                @game_over = @board.game_over
                break if @game_over == true
            end
        end
    end
end

game = Game.new