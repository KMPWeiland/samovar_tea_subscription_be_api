require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many :subscriptions }
  end

  describe "required presence attribute validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :address }
  end
end