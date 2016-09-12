require_relative 'board'
require_relative 'player'

class Game
    attr_accessor :white, :black, :board
    
    def initialize
        @white = Player.new('white')
        @black = Player.new('black')
        @board = Board.new
        
        #add row 8
        pieces_8 = [@black.piece('rook_left'), @black.piece('knight_left'), @black.piece('bishop_left'), @black.piece('king'), @black.piece('queen'), @black.piece('bishop_right'), @black.piece('knight_right'), @black.piece('rook_right')]
        @board.add_row(0, pieces_8)
        
        #add row 7
        pieces = [@black.piece('[pawn_one]'), @black.piece('pawn_two'), @black.piece('pawn_three'), @black.piece('pawn_four'), @black.piece('pawn_five'), @black.piece('pawn_six'), @black.piece('pawn_seven'), @black.piece('pawn_eight')]
        @board.add_row(1, pieces)
        
        #add row 2
        pieces = [@white.piece('pawn_one'), @white.piece('pawn_two'), @white.piece('pawn_three'), @white.piece('pawn_four'), @white.piece('pawn_five'), @white.piece('pawn_six'), @white.piece('pawn_seven'), @white.piece('pawn_eight')]
        @board.add_row(6, pieces)
        
        #add row 1
        pieces = [@white.piece('rook_left'), @white.piece('knight_left'), @white.piece('bishop_left'), @white.piece('king'), @white.piece('queen'), @white.piece('bishop_right'), @white.piece('knight_right'), @white.piece('rook_right')]
        @board.add_row(7, pieces)
        
        @board.show_board
    end

end

game = Game.new