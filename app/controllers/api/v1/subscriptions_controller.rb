class Api::V1::SubscriptionsController < ApplicationController

  def index
    subscriptions = Subscription.all

    if params[:sorted].present? && params[:sorted] == "price"
      subscriptions = Subscription.sort_by_price
    elsif 
      params[:sorted].present? && params[:sorted] == "status"
      subscriptions = Subscription.sort_by_status
    elsif 
      params[:sorted].present? && params[:sorted] == "frequency"
      subscriptions = Subscription.sort_by_frequency
    end

    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def show
    subscription = Subscription.find(params[:id])
    render json: DetailedSubscriptionSerializer.new(subscription, { include: [:teas, :customer] }), status: :ok
  end

end
 