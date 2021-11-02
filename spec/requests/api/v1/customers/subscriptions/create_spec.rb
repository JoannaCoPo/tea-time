require 'rails_helper'

describe 'user creation request' do
  describe 'happy path' do
    it 'creates a new tea subscription for a customer' do
      tea = create(:tea)
      customer = create(:customer)
      body = { "tea_id": tea.id,
                    "title": tea.name,
                    "price": 24.99,
                    "frequency": 2
                  }
      headers = {
                'Content-Type': 'application/json'
              }
      post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: body.to_json
      subscription = JSON.parse(response.body, symbolize_names: true)
      data = subscription[:data][:attributes]

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(subscription).to be_a(Hash)
      expect(subscription[:data][:type]).to eq('subscription')
      expect(data[:title]).to eq(tea.name)
      expect(data[:price]).to eq(24.99)
      # expect(data[:status]).to eq(0)  # why is this nil vs default 0?
      expect(data[:frequency]).to eq('biannually')
      expect(data[:customer_id]).to eq(customer.id)
      expect(data[:tea_id]).to eq(tea.id)
    end
  end
end
