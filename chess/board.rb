require_relative "piece.rb"

class Board 
  
  def initialize
    @grid = Array.new(8) {Array.new(8,NullPiece.new)}
    fill_board
  end 
  
  def fill_board 
    @grid[1].map! { |el| el = Pawn.new}
    @grid[6].map! { |el| el = Pawn.new}
    @grid[0] = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, Knight.new, Rook.new]
    @grid[7] = [Rook.new, Knight.new, Bishop.new, Queen.new, King.new, Bishop.new, Knight.new, Rook.new]
  end 
  
  def move_piece(start_pos, end_pos)
    start_row = start_pos[0]
    start_col = start_pos[-1]
    end_row = end_pos[0]
    end_col = end_col[-1]
    
    if @grid[start_row][start_col].is_a?(NullPiece) 
      raise "No piece at start"
    end 
    unless @grid[end_row][end_col].is_a?(NullPiece)
      raise "Cannot move to #{end_pos}"
    end
      @grid[end_row][end_col], @grid[start_row][start_col] = @grid[start_row][start_col], @grid[end_row][end_col]
  end
  
  def [](pos)
    row, col = pos 
    rows[row][col]
  end 
  
  def []=(pos, value)
    row, col = pos 
    rows[row][col] = value
  end 
  
  
  
end 


