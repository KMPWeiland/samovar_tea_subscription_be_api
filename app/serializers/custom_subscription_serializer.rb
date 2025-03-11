class CustomSubscriptionSerializer
  def initialize(subscription)
    @subscription = subscription
  end

  def as_json
    {
      data: 
      {
        id: @subscription.id,
        type: "subscription",
        attributes: {
          id: @subscription.id,
          title: @subscription.title,
          price: @subscription.price,
          status: @subscription.status,          
          frequency: @subscription.frequency
        },
        relationships: 
        {
          customer: 
          {
            data: 
              {
                id: @subscription.customer.id,
                type: "customer",
                first_name: @subscription.customer.first_name,
                last_name: @subscription.customer.last_name
              }
          },
          teas: 
          {
            data: @subscription.teas.map do |tea|
              {
                id: tea.id,
                type: "tea",
                name: tea.name,
                tea_type: tea.tea_type,
                caffeine_free: tea.caffeine_free
              }
            end
          }
        }
      }
    }
  end
end