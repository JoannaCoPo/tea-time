class Api::V1::Customers::SubscriptionsController < ApplicationController
  def create
    if find_customer && find_tea
      subscription = @customer.subscriptions.create!(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: :created
    end
  end

  def index
    if find_customer # maybe look into before_action for refactor?
      if @customer.subscriptions.count > 0
        render json: SubscriptionSerializer.new(@customer.subscriptions), status: :created
      end
      # add error handling for if none are found
    end
  end

  def update
    if find_customer
      subscription = @customer.subscriptions.find(params[:id])
      subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(subscription), status: :ok
    end
    # add error handling - if subscription is nil maybe?
    # maybe some sort of message? "subscrition has been cancelled" etc.
  end

  private

  def find_customer
    @customer = Customer.find_by(id: params[:customer_id])
    # add error handling
  end

  def find_tea
    @tea = Tea.find_by(id: params[:tea_id])
    # add error handling
  end

  def subscription_params
    params.permit(:customer_id, :title, :price, :status, :frequency, :tea_id)
  end
end
