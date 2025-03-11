require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do

  let(:customer) { create(:customer) } 
  let(:teas) { create_list(:tea, 3) }
  let(:active_subscription) { create(:subscription, :active) }
  let(:cancelled_subscription) { create(:subscription, :cancelled) }
  let(:non_payment_subscription) { create(:subscription, :non_payment) }

  # before(:each) do
  #   Subscription.destroy_all

  #   active_subscription
  #   cancelled_subscription
  #   non_payment_subscription
  # end

  describe "Happy Paths" do
    it "can retrieve a list of all subscriptions" do
      # GET /index
      get "/api/v1/subscriptions"

      expect(response).to be_successful 
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].first).to include(:id, :type, :attributes)
      expect(json[:data].first[:attributes]).to include(:id, :title, :price, :status, :unit_price)
    end

    it "should return a list of all subscriptions sorted by price when parameter is present" do
      middle = create(:item, unit_price: 50)
      cheap = create(:item, unit_price: 10)
      expensive = create(:item, unit_price: 100)

      get "/api/v1/items?sorted=price"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:data][0][:attributes][:name]).to eq(cheap.name)
      expect(json[:data][1][:attributes][:name]).to eq(middle.name)
      expect(json[:data][2][:attributes][:name]).to eq(expensive.name)
    end
  end
  
end
