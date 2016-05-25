require_relative "../lib/subgrouper.rb"

describe Subgrouper do
  context "#extract" do
    it "extracts the subgroups from the grid" do
      grid = Array.new(9, (1..9).to_a)
      subgrouper = Subgrouper.new(grid: grid)
      expected = Array.new(9) do |i|
        base = 3 * (i % 3)
        ((base + 1)..(base + 3)).to_a * 3
      end

      result = subgrouper.extract

      expect(result).to eq(expected)
    end
  end
end
