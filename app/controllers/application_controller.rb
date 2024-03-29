class ApplicationController < ActionController::API
  # before_action :authorized

  # TODO: generate a stronger secret password
  def encode_token(payload)
    JWT.encode(payload, "secret")
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT.decode(token, "secret", true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def session_user
    user_id = decoded_token[0]["user_id"]
    User.find_by(id: user_id)
  end

  def logged_id?
    !!session_user
  end

  def authorized
    render json: { message: "Please log in" }, status: :unauthorized unless logged_id?
  end
end
