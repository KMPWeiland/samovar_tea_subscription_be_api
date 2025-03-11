class TeaSerializer
  include JSONAPI::Serializer

  attributes :name,
             :description,
             :temperature,
             :brew_time,
             :caffeine_free,
             :origin_country,
             :tasting_note,
             :price,
             :stock_quantity,
             :tea_type

  has_many :subscriptions
  # has_many :subscription_teas 
  # has_many :subscriptions, through: :subscription_teas
end