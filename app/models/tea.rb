class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  validates_presence_of :name, :description, :origin, :brew_time
end
