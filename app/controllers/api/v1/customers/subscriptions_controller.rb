class Api::V1::Customers::SubscriptionsController < ApplicationController
  before_action :find_customer
  before_action :find_tea, only: %i[create]

  def create
    subscription = @customer.subscriptions.create!(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: :created
  end

  def index
    if @customer.subscriptions.count > 0
      render json: SubscriptionSerializer.new(@customer.subscriptions), status: :created
    else
      render json: { errors: "No subscriptions found" }, status: 200
    end
  end

  def update
    subscription = @customer.subscriptions.find(params[:id])
     if subscription.update!(subscription_params)
       render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: { errors: subscription.errors }
    end
  end

  private

  def find_customer
    @customer = Customer.find_by(id: params[:customer_id])
    if @customer.nil?
      render json: { errors: "Customer not found" }, status: :not_found
    end
  end

  def find_tea
    @tea = Tea.find_by(id: params[:tea_id])
    if @tea.nil?
      render json: { errors: "Tea variety not found" }, status: :not_found
    end
  end

  def subscription_params
    params.permit(:customer_id, :title, :price, :status, :frequency, :tea_id)
  end
end
