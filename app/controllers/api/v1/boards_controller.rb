class Api::V1::BoardsController < ApplicationController
  def index
    user = User.find_by(id: params[:id]).boards
    render json: user
  end
end
