require 'rails_helper'

describe 'request to cancel a user subscription' do
  describe 'happy path' do
    it 'updates an existing tea subscription for a customer to a cancelled status' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer_id: customer.id)
      subscription2 = create(:subscription, customer_id: customer.id)
      expect(subscription1.status).to eq("active")
      expect(subscription2.status).to eq("active")

      headers = { 'Content-Type': 'application/json' }
      body = { "status": 1 }

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription2.id}", headers: headers, params: body.to_json

      updated = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(response).to be_successful
      expect(Subscription.find_by(id: subscription2.id)).to eq(subscription2)
      expect(updated[:status]).to eq("cancelled")
    end
  end
end
