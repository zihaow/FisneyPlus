class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %I[login]

  def login
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      render json: { auth_token: JwtService.encode({ user_id: user.id }) }, status: :created
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end