require_relative "../lib/parser.rb"

describe Parser do
  it "returns a grid of integers from a space-delimited string" do
    str = <<PUZZLE
1 2 3
4 5 6
7 8 9
PUZZLE

    result = Parser.parse(game_str: str)

    expect(result).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

  it "ignores vertical separators" do
    str = <<PUZZLE
1 |2 |3
4 |5 |6
7 |8 |9
PUZZLE

    result = Parser.parse(game_str: str)

    expect(result).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

  it "ignores horizontal separators" do
    str = <<PUZZLE
1 2 3
------
4 5 6
------
7 8 9
PUZZLE

    result = Parser.parse(game_str: str)

    expect(result).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end

  it "ignores combined separators" do
    str = <<PUZZLE
1 |2 |3
--+--+--
4 |5 |6
--+--+--
7 |8 |9
PUZZLE

    result = Parser.parse(game_str: str)

    expect(result).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  end
end
