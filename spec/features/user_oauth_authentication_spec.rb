require 'rails_helper'

feature "user logs in with gmail" do 
  scenario "successfully" do 
    visit root_path
    mock_auth_hash
    click_link "Login with Gmail"
    expect(page).to have_content("Quickets")
    expect(page).to have_content("Tracked Artists")
    expect(page).to have_content("Nearby Events")
  end

end
