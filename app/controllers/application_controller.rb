class ApplicationController < ActionController::API
  before_action :authorized

  # !! REMEMBER: delete all noted before assessment

  # TODO: generate a stronger secret password
  def encode_token(payload)
    JWT.encode(payload, "secret")
  end

  # helper function to check a request of there is an authorization header
  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    if auth_header
      token = auth_header.split(" "[1])
      begin
        JWT.decode(token, "secret", true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  #   to find current user if their token passes its authentication
  def session_user
    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  #  check if user is logged in thorugh a
  def logged_id?
    !!session_user
  end

  # if user is not logged in, send log in message
  def authorized
    render json: { message: "Please log in" }, status: :unauthorized unless logged_id?
  end
end
