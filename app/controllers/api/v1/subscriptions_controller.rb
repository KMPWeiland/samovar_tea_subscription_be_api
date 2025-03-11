class Api::V1::SubscriptionsController < ApplicationController
  # rescue_from StandardError do |e|
  #   render json: ErrorSerializer.format_errors([e.message]), 
  #          status: :unprocessable_entity
  # end
  # rescue_from ActiveRecord::RecordNotFound do |e|
  #   render json: ErrorSerializer.format_not_found(e), status: :not_found
  # end

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

  # def show
  #   subscription = Subscription.find(params[:id])
  #   render json: DetailedSubscriptionSerializer.new(subscription, { include: [:teas, :customer] }), status: :ok
  # end

  def show
    subscription = Subscription.find(params[:id])
    render json: CustomSubscriptionSerializer.new(subscription).as_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subscription not found" }, status: :not_found
  end

  def destroy
    subscription = Subscription.find(params[:id])

    if subscription.destroy
      render json: { message: "Subscription successfully deleted." }, status: :ok
    else
      render json: { error: "Failed to delete subscription." }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subscription not found" }, status: :not_found
  end

end
 