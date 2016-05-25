class GroupValidator
  def self.check_missing(group:)
    new(group: group).check_missing
  end

  def self.validate(group:)
    new(group: group).validate
  end

  def initialize(group:)
    @group = group
  end

  def check_missing
    clean_group == group
  end

  def validate
    clean_group.uniq == clean_group
  end

  private

  attr_accessor :group

  def clean_group
    group.reject { |i| i == 0 }
  end
end
