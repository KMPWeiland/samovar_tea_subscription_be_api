class Tea < ApplicationRecord
  validates :name, presence: true
  validates :tea_type, presence: true
  validates :description, presence: true
  validates :brew_time, presence: true
  validates :caffeine_free, inclusion: { in: [true, false] }
  validates :origin_country, presence: true
  validates :price, presence: true
  validates :caffeine_free, inclusion: { in: ['moss', 'smoke', 'floral', 'cedar'] }
  validates :stock_quantity, presence: true


  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
end
