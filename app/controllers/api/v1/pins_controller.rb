class Api::V1::PinsController < ApplicationController
  def index
    pins = Pin.all
    render json: pins
  end
end
