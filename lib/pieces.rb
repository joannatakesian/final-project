class Pieces
    attr_accessor :color
    
    def initialize(color)
        @color = color
    end
    
    def symbol
        puts @symbol
    end
end

class King < Pieces
    def initialize(color)
        if color == 'black'
            @symbol = '\u265a'
        elsif color == 'white'
            @symbol = '\u2654'
        end
    end
end

class Queen < Pieces
    def initialize(color)
        if color == 'black'
            @symbol = '\u265b'
        elsif color == 'white'
            @symbol = '\u2655'
        end
    end
end

class Bishop < Pieces
    def initialize(color)
        if color == 'black'
            @symbol = '\u265d'
        elsif color == 'white'
            @symbol = '\u2657'
        end
    end
end

class Knight < Pieces
    def initialize(color)
        if color == 'black'
            @symbol = '\u265e'
        elsif color == 'white'
            @symbol = '\u2658'
        end
    end
end

class Rook < Pieces
    def initialize(color)
        if color == 'black'
            @symbol = '\u265c'
        elsif color == 'white'
            @symbol = '\u2656'
        end
    end
end

class Pawn < Pieces
    def initialize(color)
        if color == 'black'
            @symbol = '\u265f'
        elsif color == 'white'
            @symbol = '\u2659'
        end
    end
end
