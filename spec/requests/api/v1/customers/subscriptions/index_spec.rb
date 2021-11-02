require 'rails_helper'

describe 'request to get all user subscriptions' do
  describe 'happy path' do
    it 'returns all active and cancelled subscriptions' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer_id: customer.id, status: 0)
      subscription2 = create(:subscription, customer_id: customer.id, status: 1)
      subscription3 = create(:subscription, customer_id: customer.id, status: 0)
      subscription4 = create(:subscription, customer_id: customer.id, status: 1)
      subscription5 = create(:subscription, customer_id: customer.id, status: 0)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(response).to be_successful
      expect(subscriptions[0][:attributes][:status]).to eq('active')
      expect(subscriptions[1][:attributes][:status]).to eq('cancelled')
      expect(subscriptions[2][:attributes][:status]).to eq('active')
      expect(subscriptions[3][:attributes][:status]).to eq('cancelled')
      expect(subscriptions[4][:attributes][:status]).to eq('active')
    end
  end
end
