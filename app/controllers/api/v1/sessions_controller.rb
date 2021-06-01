class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:login, :auto_login]

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  #   find a user and log them in automatically
  def auto_login
    if session_user
      render json: { user: UserSerializer.new(session_user) }
    else
      render json: { error: "No User Logged in" }
    end
  end
end
