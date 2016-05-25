class Board
  def initialize(grid:, subgrouper:)
    @grid = grid
    @subgrouper = subgrouper
  end

  def rows
    grid
  end

  def cols
    grid.transpose
  end

  def subgroups
    subgrouper.extract(grid: grid)
  end

  private

  attr_accessor :grid, :subgrouper
end
