class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
end

# setup enums for status and frequency
