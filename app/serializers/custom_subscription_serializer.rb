class CustomSubscriptionSerializer
  def initialize(subscription)
    @subscription = subscription
  end

  def as_json
    {
      data: {
        id: @subscription.id,
        type: "subscription",
        attributes: {
          id: @subscription.id,
          title: @subscription.title,
          price: @subscription.price,
          status: @subscription.status,          frequency: @subscription.frequency

        }
      },
      relationships: {
        teas: {
          data: @subscription.teas.map do |tea|
            {
              id: tea.id,
              type: "tea",
              tea_type: tea.tea_type
            }
          end
        }
      }
    }
  end
end