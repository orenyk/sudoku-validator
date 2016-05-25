class Parser
  SEPARATOR_REGEX = /[-+|]+/

  def initialize(game_str:)
    @game_str = game_str
  end

  def self.parse(game_str:)
    new(game_str: game_str).parse
  end

  def parse
    lines.map { |line| line_to_array(line) }
  end

  private

  attr_accessor :game_str

  def lines
    clean_str.split("\n").reject(&:empty?)
  end

  def clean_str
    game_str.gsub(SEPARATOR_REGEX, "")
  end

  def line_to_array(line)
    line.split(" ").map(&:to_i)
  end
end
