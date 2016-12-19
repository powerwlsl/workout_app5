require 'rails_helper'

RSpec.feature "Listing members" do 
  before do 
    @user1 = User.create!(first_name:"John",last_name:"Doe", email:"example@gmail.com", password:"password")
    @user2 = User.create!(first_name:"Jane",last_name:"Doe",email:"example2@gmail.com", password:"password")
  end
  scenario "with existing name returns all those users" do 
    visit '/'
    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content("John Doe")
    expect(page).to have_content("Jane Doe")
    expect(current_path).to eq("/dashboards/search")

  end
end