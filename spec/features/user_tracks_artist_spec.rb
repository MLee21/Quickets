require "rails_helper"

feature "a user tracks a single artist" do
  attr_reader :service
    
  before(:each) do 
    @service = BandsInTownService.new
    VCR.use_cassette("denver_events") do 
      location = "Denver, CO"
      nearby_events = service.nearby_artists_at_events(location)
    end
    visit root_path
    mock_auth_hash
    click_link "Login with Gmail"
    expect(page).to have_content("Quickets")
    expect(page).to have_content("Tracked Artists")
    expect(page).to have_content("Nearby Events")
  end

  xscenario "successfully", :js => true, ngrok: true do 
    click_link "Nearby Events"
    within(".events") do 
      page.first(".tiny_button").click
    end
    expect(current_path).to eq(tracked_artist_path)
    expect(page).to have_content("You are now tracking Someone")
  end
end