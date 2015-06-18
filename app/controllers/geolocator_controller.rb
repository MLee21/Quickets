class GeolocatorController < ApplicationController
  respond_to :json

  def create
    session[:city] = params["city"]
    format_state = convert_state_to_abbreviation(params[:state])
    session[:state] = format_state
    respond_with session, location: events_path
  end

  private

  def convert_state_to_abbreviation(state)
    grab_states = Geolocator.new
    grab_states.get_abbreviation(state)
  end
end
