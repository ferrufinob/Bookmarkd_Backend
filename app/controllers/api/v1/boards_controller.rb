class Api::V1::BoardsController < ApplicationController
  def index
    boards = session_user.boards
    render json: boards
  end

  def create
    board = Board.create(name: params[:name], user_id: session_user.id)
    if board.valid?
      render json: { board: BoardSerializer.new(board) }, status: :created
    else
      render json: { error: "failed to create board" }, status: :not_acceptable
    end
  end

  private
end
