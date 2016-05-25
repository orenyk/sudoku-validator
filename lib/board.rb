require_relative "./subgrouper.rb"

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
    Subgrouper.extract(grid: grid)
  end

  private

  attr_accessor :grid
end
