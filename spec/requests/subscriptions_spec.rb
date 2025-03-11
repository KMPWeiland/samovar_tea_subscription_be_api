require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do

  let!(:customer) { create(:customer) } 
  let!(:teas) { create_list(:tea, 3) }
  let!(:active_subscription) { create(:subscription, :active, customer: customer, teas: teas) }
  let!(:cancelled_subscription) { create(:subscription, :cancelled, customer: customer, teas: teas) }
  let!(:non_payment_subscription) { create(:subscription, :non_payment, customer: customer, teas: teas) }

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
      expect(json[:data].first[:attributes]).to include(:id, :title, :price, :status, :frequency)
    end

    it "should return a list of all subscriptions sorted by price when parameter is present" do

      get "/api/v1/subscriptions?sorted=price"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][0][:attributes][:price]).to be < json[:data][1][:attributes][:price]
      expect(json[:data][1][:attributes][:price]).to be < json[:data][2][:attributes][:price]
    end

    it "should return a single subscription by ID, including the tea(s) involved and what customer(s) is subscribed or has been in the past (if cancelled)" do

      get `api/v1/subscriptions/#{active_subscription.id}`

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)

      binding.pry
      
      expect(json[:data]).to include(:id, :type, :attributes)
      # expect(json[:data][:id]).to eq("#{item.id}")
      # expect(json[:data][:type]).to eq("item")
      # expect(json[:data][:attributes][:name]).to eq(name)
      # expect(json[:data][:attributes][:description]).to eq(description)
      # expect(json[:data][:attributes][:unit_price]).to eq(price)
    end    
  end
end
