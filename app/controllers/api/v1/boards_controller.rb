class Api::V1::BoardsController < ApplicationController
  def index
    boards = session_user.boards
    render json: boards
  end
end
