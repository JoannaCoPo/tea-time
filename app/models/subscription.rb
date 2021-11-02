class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum status: [:active, :cancelled]
  enum frequency: [:biweekly, :monthly, :biannually]
end

# consider validations, maybe presence of both the customer and tea ids?
