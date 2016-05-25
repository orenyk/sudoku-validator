require_relative "../lib/group_validator.rb"

describe GroupValidator do
  context "#validate" do
    it "returns true if all numbers in group are unique" do
      group = [1, 2, 3]
      gv = GroupValidator.new(group: group)

      result = gv.validate

      expect(result).to be_truthy
    end

    it "returns false if there are duplicate numbers" do
      group = [1, 1, 3]
      gv = GroupValidator.new(group: group)

      result = gv.validate

      expect(result).to be_falsey
    end

    it "ignores zeros" do
      group = [0, 0, 1, 2]
      gv = GroupValidator.new(group: group)

      result = gv.validate

      expect(result).to be_truthy
    end
  end

  context "#check_missing" do
    it "returns true if there are no zeros in the group" do
      group = [1, 2, 3]
      gv = GroupValidator.new(group: group)

      result = gv.check_missing

      expect(result).to be_truthy
    end

    it "returns false if there are zeros in the group" do
      group = [0, 1, 2]
      gv = GroupValidator.new(group: group)

      result = gv.check_missing

      expect(result).to be_falsey
    end
  end

  context ".validate" do
    it "calls the #validate method on a new instance of GroupValidator" do
      group = [1, 2, 3]

      result = GroupValidator.validate(group: group)

      expect(result).to be_truthy
    end
  end

  context ".check_missing" do
    it "calls the #check_missing method on a new instance of GroupValidator" do
      group = [1, 2, 3]

      result = GroupValidator.check_missing(group: group)

      expect(result).to be_truthy
    end
  end
end
