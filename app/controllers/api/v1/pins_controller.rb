class Api::V1::PinsController < ApplicationController
  before_action :set_pin, only: [:show]
  # skip_before_action :authorized, only: [:index, :show]

  def index
    pins = Pin.all
    render json: pins
  end

  def show
    byebug
    if @pin
      render json: { pin: PinSerializer.new(@pin) }
    else
      render json: { error: "Pin not found." }
    end
  end

  def create
    board = Board.find_or_create_by(name: params[:name], user_id: session_user)
    pin = board.pins.build(pin_params)
    pin.user = session_user
    if pin.valid?
      render json: { pin: PinSerializer.new(pin), board: BoardSerializer.new(board) }, status: :created
    else
      render json: { error: "Failed to create pin." }, status: :not_acceptable
    end
  end

  private

  def set_pin
    @pin = Pin.find_by_id(params[:id])
  end

  def pin_params
    params.permit(:title, :description, :image, :site_url, :board_id, board_attributes: [:name])
  end
end
