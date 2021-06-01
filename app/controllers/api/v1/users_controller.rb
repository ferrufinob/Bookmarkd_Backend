class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), jwt: token }
    else
      render json: { error: "failed to create user" }
    end
  end

  private

  def user_params
    # require is for nested resources
    params.permit(:username, :email, :password)
  end
end
