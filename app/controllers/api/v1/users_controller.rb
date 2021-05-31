class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: UserSerializer.new(user), jwt: token }
    end
  end

  private

  def user_params
    # require is for nested resources
    params.permit(:username, :email, :password)
  end
end
