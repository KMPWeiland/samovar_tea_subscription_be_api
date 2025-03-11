class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :id,
             :title,
             :price,
             :status,
             :frequency,
             :customer_id
  
  belongs_to :customer 
end
