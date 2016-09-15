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
    
    def get_legal_moves(board)
        return "Error."
    end
    
    def diagonal_move(board, y, x)
        #recursively add moves until a piece is taken or the space is nil or a piece is encountered of the same color
    end
    
    def lateral_move(board, y, x)
        #recursively add moves until a piece is taken or the space is nil or a piece is encountered of the same color
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
    
    def get_legal_moves(board)
        legal_moves = []
        rows = [8, 7, 6, 5, 4, 3, 2, 1]
        columns = [*'A'..'H']
        
        possible_moves = [
            [@row + 1, @column],
            [@row - 1, @column],
            [@row, @column + 1],
            [@row, @column - 1],
            [@row + 1, @column + 1],
            [@row + 1, @column - 1],
            [@row - 1, @column + 1],
            [@row - 1, @column - 1]
            ]
        
        possible_moves.each do |move|
            y = move[0]
            x = move[1]
            if x >= 0 && x < 8
                if y >= 0 && y < 8
                    if board[y][x] == ' ' || board[y][x].color != color
                        legal_moves << "#{columns[x]}#{rows[y]}"
                    end
                end
            end
        end
        
        return legal_moves
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
    
    def get_legal_moves(board)
        #use lateral_move method in each direction
        #use diagonal_move method in each direction
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
    
    def get_legal_moves(board)
        #use diagonal_move method in each direction
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
    
    def get_legal_moves(board)
        legal_moves = []
        rows = [8, 7, 6, 5, 4, 3, 2, 1]
        columns = [*'A'..'H']
        
        possible_moves = [
            [@row + 2, @column + 1],
            [@row + 2, @column - 1],
            [@row - 2, @column + 1],
            [@row - 2, @column - 1],
            [@row + 1, @column + 2],
            [@row + 1, @column - 2],
            [@row - 1, @column + 2],
            [@row - 1, @column - 2]
            ]
        
        #must try moves in both directions (x move first, then y move first)
        
        possible_moves.each do |move|
            y = move[0]
            x = move[1]
        end
        
        return legal_moves
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
    
    def get_legal_moves(board)
        #use lateral_move method in each direction
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
            if board[@row - 1][@column + 1] != " " && board[@row - 1][@column + 1] != nil
                legal_moves << "#{columns[@column + 1]}#{rows[@row - 1]}"
            end
            if board[@row - 1][@column - 1] != " " && board[@row - 1][@column - 1] != nil
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
            if board[@row + 1][@column + 1] != " " && board[@row + 1][@column + 1] != nil
                legal_moves << "#{columns[@column + 1]}#{rows[@row + 1]}"
            end
            if board[@row + 1][@column - 1] != " " && board[@row + 1][@column - 1] != nil
                legal_moves << "#{columns[@column - 1]}#{rows[@row + 1]}"
            end
        end
        
        return legal_moves
    end
end
