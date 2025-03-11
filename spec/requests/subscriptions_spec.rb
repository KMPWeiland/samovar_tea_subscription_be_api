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

      expect(json[:data][0][:attributes][:price]).to be < json[:data][2][:attributes][:price]
    end

    it "should return a single subscription by ID" do

      get "/api/v1/subscriptions/#{active_subscription.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to include(:id, :type, :attributes)
      expect(json[:data][:id].to_s).to eq("#{active_subscription.id}")
      expect(json[:data][:type]).to eq("subscription") 
 
      expect(json[:data][:attributes][:title]).to eq(active_subscription.title)
      expect(json[:data][:attributes][:price]).to eq(active_subscription.price)
      expect(json[:data][:attributes][:status]).to eq(active_subscription.status)
      expect(json[:data][:attributes][:frequency]).to eq(active_subscription.frequency)
    end  

    it "should return a single subscription by ID with details about the tea(s) involved" do

      get "/api/v1/subscriptions/#{active_subscription.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)

      #old version: expect(json[:data][:relationships][:teas][:data][0][:id].to_i).to eq(active_subscription.teas.first.id)
      # expect(json[:data][:relationships][:teas][:data][0][:tea_type]).to eq(active_subscription.teas.first.tea_type)

      expect(json[:data][:relationships][:teas][:data][0][:id].to_i).to eq(active_subscription.teas.first.id)
      expect(json[:data][:relationships][:teas][:data][0][:tea_type]).to eq(active_subscription.teas.first.tea_type)
      expect(json[:data][:relationships][:teas][:data][0][:name]).to eq(active_subscription.teas.first.name)
      expect(json[:data][:relationships][:teas][:data][0][:caffeine_free]).to eq(active_subscription.teas.first.caffeine_free)
    end  


    it "should return a single subscription by ID with details about the customer who is or was subscribed" do

      get "/api/v1/subscriptions/#{active_subscription.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:relationships][:customer][:data][:id]).to eq(active_subscription.customer.id)
      expect(json[:data][:relationships][:customer][:data][:first_name]).to eq(active_subscription.customer.first_name)
      expect(json[:data][:relationships][:customer][:data][:last_name]).to eq(active_subscription.customer.last_name)
    end  

    it "should delete a subscription by id" do

      delete "/api/v1/subscriptions/#{active_subscription.id}"

      expect(response).to be_successful
      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:message) 
    end

    # it "should return 404 if id is invalid" do
    #   delete "/api/v1/items/678"
    #   json = JSON.parse(response.body, symbolize_names: true)
    #   expect(response).to have_http_status(:not_found)
    #   expect(json[:errors].first).to eq("Couldn't find Item with 'id'=678")
    # end
  end
end
