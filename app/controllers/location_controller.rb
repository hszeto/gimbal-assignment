class LocationController < ApplicationController
  def nearby
    render json: {}, status: 200
  end

  private

  def current_position_params
    params
      .permit(:lat, :lon)
      .to_h
      .symbolize_keys
  end
end