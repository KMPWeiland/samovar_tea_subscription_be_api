class SubscriptionsController < ApplicationController

  def index
    subscriptions = Subscription.all
    binding.pry
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

end
