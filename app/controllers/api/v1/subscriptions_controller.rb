class Api::V1::SubscriptionsController < ApplicationController

  def index
    subscriptions = Subscription.all

    if params[:sort].present? && params[:sort] == "price"
      subscriptions = Subscription.sort_by_price
    # elsif 
    #   params[:sort].present? && params[:sort] == "status"
    #   subscriptions = Subscription.sort_by_status
    # elsif 
    #   params[:sort].present? && params[:sort] == "frequency"
    #   subscriptions = Subscription.sort_by_frequency
    end

    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def show
    subscription = Subscription.find(params[:id])
    render json: CustomSubscriptionSerializer.new(subscription).as_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subscription not found" }, status: :not_found
  end

  def update
    subscription = Subscription.find(params[:id])
    
    if subscription.update(status: "Cancelled")
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: { error: subscription.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
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
 