require 'rails_helper'

RSpec.feature "User signup" do 
  scenario "with valid credential" do 
    visit "/"
    click_link "Sign up"
    fill_in "First name", with: "Hyejin"
    fill_in "Last name", with: "Ahn"
    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_content("Hyejin Ahn")

  end
end