require 'rails_helper'

RSpec.describe BandsInTownService, type: :model do 
  attr_reader :service
  
  before(:each) do 
    @service = BandsInTownService.new
  end

  it "returns nearby events" do
    VCR.use_cassette("get_nearby_events") do 
      location = "Denver, CO"
      nearby_events = service.nearby_events(location)
      expect(nearby_events).to be_an_instance_of(Array)
    end
  end

  it "returns information for nearby events" do 
    VCR.use_cassette("get_nearby_events") do 
      location = "Denver, CO"
      nearby_events = service.nearby_events(location)
      expect(nearby_events.first[:artists][0][:name]).to eq("First Responders")
      expect(nearby_events.first[:venue][:name]).to eq("Toby Keith's I Love This Bar and Grill")
    end
  end

  it "returns information for a different city's events" do 
    VCR.use_cassette("get_los_angeles_events") do 
      location = "Los Angeles, CA"
      nearby_events = service.nearby_events(location)
      expect(nearby_events.first[:artists][0][:name]).to eq("Adam Lambert")
      expect(nearby_events.first[:venue][:name]).to eq("The Original High")
    end
  end

  it "returns information for a different city's events with no state specified" do 
    VCR.use_cassette("get_portland_events") do 
      location = "Portland"
      nearby_events = service.nearby_events(location)
      expect(nearby_events.first[:artists][0][:name]).to eq("Mary Flower")
      expect(nearby_events.first[:venue][:name]).to eq("Grant House")
    end
  end

  it "returns nearby events with no state specified" do
    VCR.use_cassette("test") do 
      location = "Denver"
      nearby_events = service.nearby_events(location)
      expect(nearby_events.first[:artists][0][:name]).to eq("First Responders")
    end
  end

  it "returns nearby events with no state specified" do 
    VCR.use_cassette("get_gv_events") do 
      location = "Greenwood Village, CO"
      nearby_events = service.nearby_events(location)
      expect(nearby_events.first[:artists][0][:name]).to eq("First Responders")
    end
  end

end