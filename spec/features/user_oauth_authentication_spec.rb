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

  feature "OmniAuth" do
    scenario "should login successfully" do
      visit '/auth/google_oauth2'
      expect(page).to have_content("Quickets") 
    end

    scenario "should logout successfully" do
      visit '/auth/google_oauth2'
      expect(page).to have_content("Quickets") 
      find("li.logout a").click
      expect(current_path).to eq(root_path) 
    end
  end

end
