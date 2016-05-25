class Board
  def initialize(grid:)
    @grid = grid
  end

  def rows
    grid
  end

  def cols
    grid.transpose
  end

  def subgroups

  end

  private

  attr_accessor :grid
end
