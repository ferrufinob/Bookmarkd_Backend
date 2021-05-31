class Api::V1::PinsController < ApplicationController
  before_action :set_pin, only: [:show]

  def index
    pins = Pin.all
    render json: pins
  end

  def show
    if @pin
      render json: { pin: PinSerializer.new(@pin) }
    else
      render json: { error: "Pin not found." }
    end
  end

  private

  def set_pin
    @pin = Pin.find_by_id(params[:id])
  end
end
