require "rails_helper"


feature "a user after logging in" do 
  let!(User.create(email: "minnie.lee89@gmail.com"))
  xscenario "will be able to see the events in the nearby area" do 
    visit root_path
    click_link "Login with Gmail"
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link("Tracked Artists")
    expect(page).to have_link("Nearby Events")

    click_link "Nearby Events"
    expect(page).to have_content("")
  end
end