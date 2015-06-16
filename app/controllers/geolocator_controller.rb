class GeolocatorController < ApplicationController
  respond_to :json

  def create
    session[:lat] = params["lat"]
    session[:lon] = params["lon"]
    respond_with session, location: events_path
  end

end