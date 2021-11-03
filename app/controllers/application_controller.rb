class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def invalid_record(error)
    render json: { errors: error }, status: 400
  end
end
