class Api::V1::BoardsController < ApplicationController
  before_action :set_board, only: [:destroy]

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

  def destroy
    if @board.destroy
      render json: { message: "successfully deleted" }
    else
      render json: { error: "there seems to be an issue deleting your board" }
    end
  end

  private

  def set_board
    @board = Board.find_by_id(params[:id])
  end
end
