class LocationsController < ApplicationController
  before_action :validate_latlon

  def nearby
    render json: {}, status: 200
  end

  private

  def validate_latlon
    render json:{error: 'missing params'}, status: 422 if !latlon_present?
    render json:{error: 'invalid params'}, status: 422 if !all_floats?
  end

  def latlon_present?
    %i(lat lon).all? { |l| current_position_params.key? l }
  end

  def all_floats?
    current_position_params.values.all? { |f| !!Float(f) rescue false }
  end

  def current_position_params
    params.permit(:lat, :lon)
          .to_h
          .symbolize_keys
  end
end