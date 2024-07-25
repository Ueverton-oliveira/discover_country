require 'rails_helper'

RSpec.describe Country, type: :model do
  describe "validations" do
    subject { build(:country) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:capital) }
    it { should validate_numericality_of(:population).only_integer.is_greater_than_or_equal_to(0).allow_nil }
    it { should validate_numericality_of(:area).is_greater_than_or_equal_to(0).allow_nil }
  end


  describe "factories" do
    it "has a valid factory" do
      expect(build(:country)).to be_valid
    end
  end
end
