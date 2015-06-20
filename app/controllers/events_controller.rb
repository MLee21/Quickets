require 'uri'

class EventsController < ApplicationController

  def index
    service = BandsInTownService.new
    location = session[:city] + "," + " " + session[:state]
    @artists = service.nearby_artists_at_events(location)
  end

end