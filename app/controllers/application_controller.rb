class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ArgumentError, with: :invalid_argument

  def invalid_record(error)
    render json: { errors: error }, status: 400
  end

  def invalid_argument(error)
    render json: { errors: error }, status: 400
  end
end
