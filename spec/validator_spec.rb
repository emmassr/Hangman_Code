require "validator"
describe Validator do
  it "checks if a valid character is a letter" do
    validator = Validator.new()
    user_input = "a"
    expect(validator.is_letter?(user_input)).to eq(true)
  end

  it "checks if an invalid character is a letter" do
    validator = Validator.new()
    user_input = "%"
    expect(validator.is_letter?(user_input)).to eq(false)
  end

  it "checks if a valid character is a letter when its uppercase" do
    validator = Validator.new()
    user_input = "A"
    expect(validator.is_letter?(user_input)).to eq(true)
  end
end
