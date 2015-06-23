require "rails_helper"

# feature "a user tracks a single artist" do

#   scenario "successfully", :js => true, ngrok: true do 
#     VCR.use_cassette("get_nearby_events") do
#       visit dashboard_path
#       click_link "Nearby Events"
#       all('.events')[0].select_option
#       expect(current_path).to eq(tracked_artist_path)
#     end
#   end
# end