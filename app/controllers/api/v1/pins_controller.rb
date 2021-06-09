class Api::V1::PinsController < ApplicationController
  before_action :set_pin, only: [:show]
  # skip_before_action :authorized, only: [:index, :show]

  def index
    pins = Pin.with_attached_image
    render json: pins
  end

  def show
    if @pin
      render json: { pin: PinSerializer.new(@pin) }
    else
      render json: { error: "Pin not found." }
    end
  end

  def create
    if params[:board] != ""
      board = Board.find_or_create_by(name: params[:board], user_id: session_user.id)
      if params[:title] != "" && params[:description] != "" && params[:site_url] != "" && params[:image] != ""
        pin = Pin.create(pin_params)
        pin.board_id = board.id
        pin.user = session_user
        render json: { pin: PinSerializer.new(pin), board: BoardSerializer.new(board) }, status: :created
      else
        render json: { error: "All Fields Required." }, status: 422
      end
    else
      render json: { error: "Choose or create a board." }, status: 422
    end
  end

  private

  def set_pin
    @pin = Pin.find_by_id(params[:id])
  end

  def pin_params
    params.permit(:title, :description, :image, :site_url, :board_id)
  end
end
