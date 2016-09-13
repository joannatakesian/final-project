require_relative 'pieces'

class Board
    attr_accessor :board, :spaces
    
    def initialize
        @spaces = [
            [
                Rook.new('rook one', 'black', 0, 0),
                Knight.new('knight one', 'black', 0, 1),
                Bishop.new('bishop one', 'black', 0, 2),
                King.new('king', 'black', 0, 3),
                Queen.new('queen', 'black', 0, 4),
                Bishop.new('bishop two', 'black', 0, 5),
                Knight.new('knight two', 'black', 0, 6),
                Rook.new('rook two', 'black', 0, 7)
                ], 
            [
                Pawn.new('pawn one', 'black', 1, 0),
                Pawn.new('pawn two', 'black', 1, 1),
                Pawn.new('pawn three', 'black', 1, 2),
                Pawn.new('pawn four', 'black', 1, 3),
                Pawn.new('pawn five', 'black', 1, 4),
                Pawn.new('pawn six', 'black', 1, 5),
                Pawn.new('pawn seven', 'black', 1, 6),
                Pawn.new('pawn eight', 'black', 1, 7)
                ], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
            [
                Pawn.new('pawn one', 'white', 1, 0),
                Pawn.new('pawn two', 'white', 1, 1),
                Pawn.new('pawn three', 'white', 1, 2),
                Pawn.new('pawn four', 'white', 1, 3),
                Pawn.new('pawn five', 'white', 1, 4),
                Pawn.new('pawn six', 'white', 1, 5),
                Pawn.new('pawn seven', 'white', 1, 6),
                Pawn.new('pawn eight', 'white', 1, 7)
                ], 
            [
                Rook.new('rook one', 'white', 0, 0),
                Knight.new('knight one', 'white', 0, 1),
                Bishop.new('bishop one', 'white', 0, 2),
                King.new('king', 'white', 0, 3),
                Queen.new('queen', 'white', 0, 4),
                Bishop.new('bishop two', 'white', 0, 5),
                Knight.new('knight two', 'white', 0, 6),
                Rook.new('rook two', 'white', 0, 7)
                ]
            ]
    end
    
    def show_board
        top_labels = ('a'..'h').to_a
        puts '  ---------------------------------'
        @spaces.each_with_index do |line, index|
            printf "#{8 - index} | "
            line.each do |piece|
                if piece != ' '
                    printf "#{piece.symbol} | "
                else
                    printf "  | "
                end
            end
            puts ' '
            puts '  ---------------------------------'
        end
        puts "  | #{top_labels.join(' | ')} |"
    end
end