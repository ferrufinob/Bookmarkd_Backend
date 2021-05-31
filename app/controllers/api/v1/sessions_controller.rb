class Api::V1::SessionsController < ApplicationController

  
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: UserSerializer.new(user), jwt: token }
    else
      render json: { status: "error", message: "Invalid username or password" }
    end
  end

  #   find a user and log them in automatically
  def auto_login
    if session_user
        render json {user: UserSerializer.new(session_user)}
    else
        render json: {error: "No User Logged in"}
    end
  end
end
