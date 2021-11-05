require 'rails_helper'

describe 'request to cancel a user subscription' do
  describe 'happy path' do
    it 'updates an existing tea subscription for a customer to a cancelled status' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer_id: customer.id)

      expect(subscription1.status).to eq("active")

      headers = { 'Content-Type': 'application/json' }
      body = { "status": 1 }

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription1.id}", headers: headers, params: body.to_json

      updated = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(response).to be_successful
      expect(Subscription.find_by(id: subscription1.id)).to eq(subscription1)
      expect(updated[:status]).to eq("cancelled")
    end
  end

  describe 'sad path and edge cases' do
    it 'returns an error for invalid status input' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer_id: customer.id)
      body = { "status": 5 }

      headers = { 'Content-Type': 'application/json' }

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription1.id}", headers: headers, params: body.to_json

      updated = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(updated[:errors]).to eq("'5' is not a valid status")
    end

    it 'returns an error if the cancellation did not occur' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer_id: customer.id)
      # body = { "status": nil}

      headers = { 'Content-Type': 'application/json' }

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription1.id}", headers: headers, params: body.to_json

      updated = JSON.parse(response.body, symbolize_names: true)

      # expect(response).to_not be_successful
      # expect(response.status).to eq(400)
      expect(updated[:errors]).to eq("Validation failed: Status can't be blank")
    end
  end
end
