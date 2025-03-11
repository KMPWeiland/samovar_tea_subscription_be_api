class DetailedSubscriptionSerializer
  include JSONAPI::Serializer

  attributes :id,
             :title,
             :price,
             :status,
             :frequency  

  has_many :teas do |subscription|
  subscription.teas
  end
  belongs_to :customer, serializer: CustomerSerializer
end
