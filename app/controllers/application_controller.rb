class ApplicationController < ActionController::Base
  before_action :authenticate_user
  skip_before_action :verify_authenticity_token

  def render_error(message, status)
    render json: { error: message }, status: status
  end

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JwtService.decode(header)
      @current_user = User.find_by(id: @decoded[:user_id])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { error: 'Access denied' }, status: :unauthorized
    end
  end
end
