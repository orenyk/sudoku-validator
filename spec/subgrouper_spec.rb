require_relative "../lib/subgrouper.rb"

describe Subgrouper do
  context "#extract" do
    it "extracts the subgroups from the grid" do
      grid = mock_grid
      subgrouper = Subgrouper.new(grid: grid)
      expected = expected_subgroups

      result = subgrouper.extract

      expect(result).to eq(expected)
    end
  end

  context ".extract" do
    it "instantiates a Subgrouper with the passed grid and calls extract" do
      grid = mock_grid
      expected = expected_subgroups

      result = Subgrouper.extract(grid: grid)

      expect(result).to eq(expected)
    end
  end

  def mock_grid
    Array.new(9, (1..9).to_a)
  end

  def expected_subgroups
    Array.new(9) do |i|
      base = 3 * (i % 3)
      ((base + 1)..(base + 3)).to_a * 3
    end
  end
end
