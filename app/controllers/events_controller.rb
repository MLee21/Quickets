require 'uri'

class EventsController < ApplicationController

  def index
    service = BandsInTownService.new
    location = session[:city] + "," + " " + session[:state]
    encoded_location = URI.encode(location)
    @events = service.nearby_events(encoded_location)
  end

end