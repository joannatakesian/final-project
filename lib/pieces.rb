class Pieces
    attr_accessor :name, :color
    
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        @symbol = nil
    end
    
    def symbol
        return @symbol
    end
    
    def name
        return @name
    end
    
    def color
        return @color
    end
    
    def change_coordinates(y, x)
        @row = y
        @column = x
    end
    
    def get_legal_moves
        return "Error."
    end
end

class King < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        if color == 'white'
            @symbol = "\u265a"
        elsif color == 'black'
            @symbol = "\u2654"
        end
    end
    
    def get_legal_moves
        legal_moves = []
        rows = [8, 7, 6, 5, 4, 3, 2, 1]
        columns = [*'A'..'H']
    end
end

class Queen < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        if color == 'white'
            @symbol = "\u265b"
        elsif color == 'black'
            @symbol = "\u2655"
        end
    end
end

class Bishop < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        if color == 'white'
            @symbol = "\u265d"
        elsif color == 'black'
            @symbol = "\u2657"
        end
    end
end

class Knight < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        if color == 'white'
            @symbol = "\u265e"
        elsif color == 'black'
            @symbol = "\u2658"
        end
    end
end

class Rook < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        if color == 'white'
            @symbol = "\u265c"
        elsif color == 'black'
            @symbol = "\u2656"
        end
    end
end

class Pawn < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        if color == 'white'
            @symbol = "\u265f"
        elsif color == 'black'
            @symbol = "\u2659"
        end
    end
    
    def get_legal_moves(board)
        legal_moves = []
        rows = [8, 7, 6, 5, 4, 3, 2, 1]
        columns = [*'A'..'H']
        
        if @color == 'white'
            #move one space forward
            if board[@row - 1][@column] == " "
                legal_moves << "#{columns[@column]}#{rows[@row - 1]}"
            end
            #move two spaces forward if first move
            if @row == 6
                if board[@row - 2][@column] == " "
                    legal_moves << "#{columns[@column]}#{rows[@row - 2]}"
                end
            end
            #take a piece
            if board[@row - 1][@column + 1] != " "
                legal_moves << "#{columns[@column + 1]}#{rows[@row - 1]}"
            end
            if board[@row - 1][@column - 1] != " "
                legal_moves << "#{columns[@column - 1]}#{rows[@row - 1]}"
            end
        elsif @color == 'black'
            #move one space forward
            if board[@row + 1][@column] == " "
                legal_moves << "#{columns[@column]}#{rows[@row + 1]}"
            end
            #move two spaces forward if first move
            if @row == 1
                if board[@row + 2][@column] == " "
                    legal_moves << "#{columns[@column]}#{rows[@row + 2]}"
                end
            end
            #take a piece
            if board[@row + 1][@column + 1] != " "
                legal_moves << "#{columns[@column + 1]}#{rows[@row + 1]}"
            end
            if board[@row + 1][@column - 1] != " "
                legal_moves << "#{columns[@column - 1]}#{rows[@row + 1]}"
            end
        end
        
        return legal_moves
    end
end
