require_relative "../lib/board.rb"

describe Board do
  context "#rows" do
    it "returns an array of rows" do
      grid = mock_grid
      subgrouper = mock_subgrouper
      board = Board.new(grid: grid, subgrouper: subgrouper)
      expected = Array.new(9, (1..9).to_a)

      result = board.rows

      expect(result).to eq(expected)
    end
  end

  context "#cols" do
    it "returns an array of the columns" do
      grid = mock_grid
      subgrouper = mock_subgrouper
      board = Board.new(grid: grid, subgrouper: subgrouper)
      expected = Array.new(9) { |i| Array.new(9, i+1) }

      result = board.cols

      expect(result).to eq(expected)
    end
  end

  context "#subgroups" do
    it "calls #extract on the subgrouper" do
      grid = mock_grid
      subgrouper = mock_subgrouper
      board = Board.new(grid: grid, subgrouper: subgrouper)

      board.subgroups

      expect(subgrouper).to have_received(:extract)
        .with(grid: grid)
    end
  end

  def mock_grid
    Array.new(9, (1..9).to_a)
  end

  def mock_subgrouper
    double("subgrouper").tap do |subgrouper|
      allow(subgrouper).to receive(:extract)
    end
  end
end
