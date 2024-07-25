class AuthController < ApplicationController

  def signup
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def login
    authentication_service = AuthenticationService.new(params[:email], params[:password])
    token = authentication_service.authenticate

    if token
      render json: { token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
