class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: [:active, :cancelled]
  enum frequency: [:biweekly, :monthly, :biannually]

  validates_presence_of :title, :price, :status, :frequency, :customer_id, :tea_id
end

# consider validation - prevent duplicate subscriptions
