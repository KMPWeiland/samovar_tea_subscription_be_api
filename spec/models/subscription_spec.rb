require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it { should belong_to :customer }
    it { should have_many :subscription_teas }
    it { should have_many(:teas).through(:subscription_teas) }
  end

  describe "required presence attribute validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :frequency }
  end

  describe "::sort_by_price" do
    it "sorts subscriptions by price in ascending order" do
      customer = create(:customer)
      
      subscription1 = create(:subscription, price: 30, customer: customer)
      subscription2 = create(:subscription, price: 10, customer: customer)
      subscription3 = create(:subscription, price: 20, customer: customer)
  
      sorted = Subscription.sort_by_price
  
      expect(sorted.first).to eq(subscription2)
      expect(sorted.second).to eq(subscription3)
      expect(sorted.last).to eq(subscription1)
    end
  end
end