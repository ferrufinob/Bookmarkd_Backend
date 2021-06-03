class Api::V1::SessionsController < ApplicationController
  skip_before_action :authorized, only: [:login, :autologin]

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

  def autologin
    if session_user
      render json: { user: UserSerializer.new(session_user) }, status: :accepted
    else
      render json: { error: "No User Logged in" }
    end
  end
end
