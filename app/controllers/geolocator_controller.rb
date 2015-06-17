class GeolocatorController < ApplicationController
  respond_to :json

  def create
    session[:city] = params["city"]
    respond_with session, location: events_path
  end

end
