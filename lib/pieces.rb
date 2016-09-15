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
    
    def recursive_move(board, y, x, direction_y, direction_x)
        rows = [8, 7, 6, 5, 4, 3, 2, 1]
        columns = [*'A'..'H']
        
        new_y = y + direction_y
        new_x = x + direction_x
        
        if new_y >= 0 && new_y < 8
            if new_x >= 0 && new_x < 8
                if board[new_y][new_x] == ' '
                    @legal_moves << "#{columns[new_x]}#{rows[new_y]}"
                    if new_y + direction_y >= 0 && new_y + direction_y < 8
                        if new_x + direction_x >= 0 && new_x + direction_x < 8
                            recursive_move(board, new_y, new_x, direction_y, direction_x)
                        end
                    end
                elsif board[new_y][new_x].color != color
                    @legal_moves << "#{columns[new_x]}#{rows[new_y]}"
                end
            end
        end
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
        @legal_moves = []
        if color == 'white'
            @symbol = "\u265b"
        elsif color == 'black'
            @symbol = "\u2655"
        end
    end
    
    def get_legal_moves(board)
        @legal_moves.clear
        possible_moves = [
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1],
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1]
            ]
        
        possible_moves.each do |move|
            recursive_move(board, @row, @column, move[0], move[1])
        end
        
        return @legal_moves
    end
end

class Bishop < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        @legal_moves = []
        if color == 'white'
            @symbol = "\u265d"
        elsif color == 'black'
            @symbol = "\u2657"
        end
    end
    
    def get_legal_moves(board)
        @legal_moves.clear
        possible_moves = [
            [1, 1],
            [1, -1],
            [-1, 1],
            [-1, -1]
            ]
        
        possible_moves.each do |move|
            recursive_move(board, @row, @column, move[0], move[1])
        end
        
        return @legal_moves
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

class Rook < Pieces
    def initialize(name, color, y, x)
        @name = name
        @color = color
        @row = y
        @column = x
        @legal_moves = []
        if color == 'white'
            @symbol = "\u265c"
        elsif color == 'black'
            @symbol = "\u2656"
        end
    end
    
    def get_legal_moves(board)
        @legal_moves.clear
        possible_moves = [
            [1, 0],
            [-1, 0],
            [0, 1],
            [0, -1]
            ]
        
        possible_moves.each do |move|
            recursive_move(board, @row, @column, move[0], move[1])
        end
        
        return @legal_moves
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
            if board[@row - 1][@column + 1] != " " && board[@row - 1][@column + 1] != nil && board[@row - 1][@column + 1].color != color
                legal_moves << "#{columns[@column + 1]}#{rows[@row - 1]}"
            end
            if board[@row - 1][@column - 1] != " " && board[@row - 1][@column - 1] != nil && board[@row - 1][@column + 1].color != color
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
            if board[@row + 1][@column + 1] != " " && board[@row + 1][@column + 1] != nil && board[@row + 1][@column + 1].color != color
                legal_moves << "#{columns[@column + 1]}#{rows[@row + 1]}"
            end
            if board[@row + 1][@column - 1] != " " && board[@row + 1][@column - 1] != nil && board[@row + 1][@column - 1].color != color
                legal_moves << "#{columns[@column - 1]}#{rows[@row + 1]}"
            end
        end
        
        return legal_moves
    end
end
