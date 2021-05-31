class ApplicationController < ActionController::API

  # !! REMEMBER: delete all noted before assessment

  # TODO: generate a stronger secret password
  def encode_token(payload)
    JWT.encode(payload, "secret")
  end

  # helper function to check a request of there is an authorization header
  def auth_header_token
    request.headers["Authorization"].split(" ")[1]
  end

  def decoded_token
    if auth_header_token
      begin
        JWT.decode(auth_header_token, "secret", true, algorithm: "HS256")
      rescue JWT::DecodeError
        []
      end
    end
  end

  #   to find current user if their token passes its authentication
  def session_user
    decoded_hash = decoded_token
    if !decoded_hash.empty?
      user_id = decoded_hash[0]["user_id"]
      user = User.find_by(id: user_id)
    end
  end
end
