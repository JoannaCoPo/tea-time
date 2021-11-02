require 'rails_helper'

describe 'request to cancel a user subscription' do
  describe 'happy path' do
    it 'destroys an existing tea subscription for a customer' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer_id: customer.id)
      subscription2 = create(:subscription, customer_id: customer.id)
require "pry"; binding.pry
      delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription2.id}"

      expect(response).to be_successful
      expect(Subscription.find_by(id: subscription1.id)).to eq(subscription1)
      require "pry"; binding.pry
      expect(Subscription.find_by(id: subscription2.id)).to eq(nil)
    end
  end
end
