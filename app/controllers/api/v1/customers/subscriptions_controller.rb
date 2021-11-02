class Api::V1::Customers::SubscriptionsController < ApplicationController
  def create
    # if Tea.find(params[:tea_id]) && Customer.find(params[:id])
    if find_customer && find_tea
      subscription = @customer.subscriptions.create!(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: :created
    end
  end

  def find_customer
    # require "pry"; binding.pry
    @customer = Customer.find_by(id: params[:customer_id])
    # add error handling
  end

  def find_tea
    @tea = Tea.find_by(id: params[:tea_id])
    # add error handling
  end

  def subscription_params
    params.permit(:customer_id, :title, :price, :frequency, :tea_id)
  end
end
