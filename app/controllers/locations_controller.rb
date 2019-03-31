class LocationsController < ApplicationController
  before_action :validate_coordinate

  def nearby
    results = Distance::Calculator.new(
      [ current_position_params[:lat].to_f, current_position_params[:lon].to_f ]
    ).closest_five

    radius = results.last[:distance]

    render json: { cafes: results, radius: radius }, status: 200
  end

  private

  def validate_coordinate
    render json: { error: 'missing params' }, status: 422 and return if !coordinate_present?
    render json: { error: 'invalid params' }, status: 422 and return if !all_floats?
  end

  def coordinate_present?
    %i(lat lon).all? { |l| current_position_params.key? l }
  end

  def all_floats?
    current_position_params.values.all? { |f| !!Float(f) rescue false }
  end

  def current_position_params
    params.require(:location)
          .permit(:lat, :lon)
          .to_h
          .symbolize_keys
  end
end
