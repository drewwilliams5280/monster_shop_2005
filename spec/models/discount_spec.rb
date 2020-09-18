require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :percentage }
  end

  describe "relationships" do
    it {should belong_to :item}
  end
end
