require 'rails_helper'

RSpec.feature "Editing Exercise" do 
  before do 
    @user = User.create!(email:"example@gmail.com", password:"password")
    login_as(@user)
    @e1 = @user.exercises.create!(duration: 10, detail: "weight lifting", date: Date.today)    
  end
  scenario "with valid data succeeds" do 
    visit "/"
    click_link "My Lounge"

    expect(page).to have_link("Edit")
    click_link "Edit"
    fill_in "Duration", with: 40
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(40)
    expect(page).not_to have_content(10)
  end

end