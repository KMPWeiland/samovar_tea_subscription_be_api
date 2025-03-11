class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :status, inclusion: { in: ["Active", "Cancelled", "Non-Payment"] }
  validates :frequency, presence: true 

  belongs_to :customer

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  def self.sort_by_price
    self.order(price: :asc)
  end

  def self.sort_by_status
    self.order(status: :asc)
  end

  def self.sort_by_frequency
    self.order(frequency: :asc)
  end
end



