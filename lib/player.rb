require_relative 'pieces'

class Player
    attr_accessor :color, :pieces
    
    def initialize(color)
        @color = color
        @king = King.new(color)
        @queen = Queen.new(color)
        @bishop_left = Bishop.new(color)
        @bishop_right = Bishop.new(color)
        @knight_left = Knight.new(color)
        @knight_right = Knight.new(color)
        @rook_left = Rook.new(color)
        @rook_right = Rook.new(color)
        @pawn_one = Pawn.new(color)
        @pawn_two = Pawn.new(color)
        @pawn_three = Pawn.new(color)
        @pawn_four = Pawn.new(color)
        @pawn_five = Pawn.new(color)
        @pawn_six = Pawn.new(color)
        @pawn_seven = Pawn.new(color)
        @pawn_eight = Pawn.new(color)
    end
end