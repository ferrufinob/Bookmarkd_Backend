class Api::V1::PinsController < ApplicationController
  before_action :set_pin, only: [:show, :destroy]
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
    board = Board.find_by(id: params[:board_id])
    pin = session_user.pins.build(pin_params)
    pin.board_id = board.id
    if pin.save
      render json: { pin: PinSerializer.new(pin), board: BoardSerializer.new(board) }, status: :created
    else
      render json: { error: "Failed to create pin." }, status: :not_acceptable
    end
  end

  def destroy
    if @pin.destroy
      render json: { message: "successfully deleted" }
    else
      render json: { error: "there seems to be an issue deleting your pin" }
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
