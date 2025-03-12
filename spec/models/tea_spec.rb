require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'associations' do
    it { should have_many :subscription_teas }
    it { should have_many(:subscriptions).through(:subscription_teas) }
  end

  describe "required presence attribute validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :tea_type }
    it { should validate_presence_of :description }
    it { should validate_presence_of :brew_time }
    it { should validate_presence_of :origin_country }
    it { should validate_presence_of :price }
    it { should validate_presence_of :stock_quantity }
  end
end