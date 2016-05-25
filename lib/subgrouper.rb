class Subgrouper
  SUBGROUP_SIZE = 3

  def initialize(grid:)
    @grid = grid
  end

  def extract
    out = []

    subgroup_indices.each do |base_y|
      subgroup_indices.each do |base_x|
        out << extract_subgroup(base_x: base_x, base_y: base_y)
      end
    end

    out
  end

  private

  attr_accessor :grid

  def extract_subgroup(base_x:, base_y:)
    subgroup_rows(base_y: base_y).map do |row|
      subgroup_cols(row: row, base_x: base_x)
    end.flatten
  end

  def subgroup_rows(base_y:)
    grid[subgroup_range(start: base_y)]
  end

  def subgroup_cols(row:, base_x:)
    row[subgroup_range(start: base_x)]
  end

  def subgroup_indices
    (0..SUBGROUP_SIZE - 1).map { |i| SUBGROUP_SIZE * (i % SUBGROUP_SIZE) }
  end

  def index_base(i)
    SUBGROUP_SIZE * (i % SUBGROUP_SIZE)
  end

  def subgroup_range(start:)
    start..start + SUBGROUP_SIZE - 1
  end
end
