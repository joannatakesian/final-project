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
    
    def piece(value)
        case value
        when 'king'
            return @king.symbol
        when 'queen'
            return @queen.symbol
        when 'bishop_left'
            return @bishop_left.symbol
        when 'bishop_right'
            return @bishop_right.symbol
        when 'knight_left'
            return @knight_left.symbol
        when 'knight_right'
            return @knight_right.symbol
        when 'rook_left'
            return @rook_left.symbol
        when 'rook_right'
            return @rook_right.symbol
        when 'pawn_one'
            return @pawn_one.symbol
        when 'pawn_two'
            return @pawn_two.symbol
        when 'pawn_three'
            return @pawn_three.symbol
        when 'pawn_four'
            return @pawn_four.symbol
        when 'pawn_five'
            return @pawn_five.symbol
        when 'pawn_six'
            return @pawn_six.symbol
        when 'pawn_seven'
            return @pawn_seven.symbol
        when 'pawn_eight'
            return @pawn_eight.symbol
        end
    end
end