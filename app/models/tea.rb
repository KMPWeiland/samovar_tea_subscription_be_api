class Tea < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :brew_time, presence: true
  validates :caffeine_free, presence: true
  validates :origin_country, presence: true
  validates :tasting_note, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true


  has_many :subscription_teas
  has_many :subscriptions, through subscription_teas
end
