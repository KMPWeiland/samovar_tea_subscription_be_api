require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  let(:customer) { create(:customer) } 
  let(:teas) { create_list(:tea, 3) }
  let!(:subscriptions) { create_list(:subscription, 3, customer: customer) }


  describe "Happy Paths" do
    it "can retrieve a list of all subscriptions" do
      # GET /index
      get "/api/v1/subscriptions"

      expect(response).to be_successful 
      expect(response.status).to eq(200)
    end
  end
  
end
