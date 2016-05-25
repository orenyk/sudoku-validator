require_relative "./board.rb"
require_relative "./group_validator.rb"
require_relative "./parser.rb"
require_relative "./subgrouper.rb"

class Validator
  VALID_MSG = "This sudoku is valid."
  INVALID_MSG = "This sudoku is invalid."
  INCOMPLETE_MSG = "This sudoku is valid, but incomplete."

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    return INVALID_MSG unless groups_valid?
    return INCOMPLETE_MSG unless groups_complete?
    VALID_MSG
  end

  private

  attr_accessor :puzzle_string

  def groups_valid?
    groups.all? { |group| GroupValidator.validate(group: group) }
  end

  def groups_complete?
    groups.all? { |group| GroupValidator.check_missing(group: group) }
  end

  def groups
    board.rows + board.cols + board.subgroups
  end

  def board
    @board ||= Board.new(grid: grid, subgrouper: Subgrouper)
  end

  def grid
    @grid ||= Parser.parse(game_str: puzzle_string)
  end

end
