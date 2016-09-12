require_relative 'player'

class Board
    attr_accessor :board, :spaces
    
    def initialize
        @spaces = [
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
            ]
    end
    
    def show_board
        top_labels = ('a'..'h').to_a
        puts '  ---------------------------------'
        @spaces.each_with_index do |line, index|
            puts "#{8 - index} | #{line.join(' | ')} |"
            puts '  ---------------------------------'
        end
        puts "  | #{top_labels.join(' | ')} |"
    end
    
    def add_row(x, pieces)
        @spaces[x] = pieces
    end
    
    def add_piece(x, y, piece)
        @spaces[x][y] = piece
    end
end