require "rails_helper"

RSpec.describe BandsInTownService, type: :model do 
  attr_reader :service
  
  before(:each) do 
    @service = BandsInTownService.new
  end

  it "returns a list of a single artist's events" do
    VCR.use_cassette("get_artist_events") do 
      # store artist in database
      # artist = Artist.create(name: 'Metric')
      artist = "Metric"
      events = service.get_artist_events(artist)

      expect(events).to be_an_instance_of(Array)
    end
  end

  it "returns correct information for a single artist's events" do 
    VCR.use_cassette("get_artist_events") do 
      artist = "Metric"
      events = service.get_artist_events(artist)
      
      expect(events.first[:formatted_location]).to eq("Rosemont, IL")
      expect(events.first[:title]).to eq("Metric @ Allstate Arena in Rosemont, IL")
      expect(events.first[:ticket_url]).to eq("http://www.bandsintown.com/event/9738458/buy_tickets?app_id=Quickets&artist=Metric&came_from=67")
      expect(events.first[:description]).to eq("Imagine Dragons with Metric Tickets")
    end
  end

end