class Pieces
    attr_accessor :color
    
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        
        place_piece(y, x)
    end
    
    def place_piece(x, y)
        x = x y = y
    end
    
    def symbol
        return @symbol
    end
end

class King < Pieces
    def initialize(name, color, y, x)
        if color == 'white'
            @symbol = "\u265a"
        elsif color == 'black'
            @symbol = "\u2654"
        end
    end
end

class Queen < Pieces
    def initialize(name, color, y, x)
        if color == 'white'
            @symbol = "\u265b"
        elsif color == 'black'
            @symbol = "\u2655"
        end
    end
end

class Bishop < Pieces
    def initialize(name, color, y, x)
        if color == 'white'
            @symbol = "\u265d"
        elsif color == 'black'
            @symbol = "\u2657"
        end
    end
end

class Knight < Pieces
    def initialize(name, color, y, x)
        if color == 'white'
            @symbol = "\u265e"
        elsif color == 'black'
            @symbol = "\u2658"
        end
    end
end

class Rook < Pieces
    def initialize(name, color, y, x)
        if color == 'white'
            @symbol = "\u265c"
        elsif color == 'black'
            @symbol = "\u2656"
        end
    end
end

class Pawn < Pieces
    def initialize(name, color, y, x)
        if color == 'white'
            @symbol = "\u265f"
        elsif color == 'black'
            @symbol = "\u2659"
        end
    end
end
