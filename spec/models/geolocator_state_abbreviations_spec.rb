require 'rails_helper'

RSpec.describe Geolocator, type: :model do 

  it "returns the correct abbreviation based on the state" do 
    grab_state = Geolocator.new
    state = "Texas"
    results = grab_state.get_abbreviation(state)
    expect(results).to eq("TX")
  end

  it "returns the correct abbreviation based on the state" do 
    grab_state = Geolocator.new
    state = "Colorado"
    results = grab_state.get_abbreviation(state)
    expect(results).to eq("CO")
  end

  it "returns the correct abbreviation based on the state" do 
    grab_state = Geolocator.new
    state = "New York"
    results = grab_state.get_abbreviation(state)
    expect(results).to eq("NY")
  end

  it "returns the correct abbreviation based on the state" do 
    grab_state = Geolocator.new
    state = "California"
    results = grab_state.get_abbreviation(state)
    expect(results).to eq("CA")
  end

  it "returns the correct abbreviation based on the state" do 
    grab_state = Geolocator.new
    state = "Florida"
    results = grab_state.get_abbreviation(state)
    expect(results).to eq("FL")
  end
end