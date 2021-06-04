class Api::V1::SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:login, :autologin]

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
    token = encode_token({ user_id: session_user.id })
    render json: { user: UserSerializer.new(session_user), jwt: token }, status: :accepted
  end
end
