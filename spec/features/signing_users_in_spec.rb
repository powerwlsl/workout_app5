require 'rails_helper'

RSpec.feature "User signup" do 
  before do 
    @user = User.create!(first_name:"John",last_name:"Doe",email:"example@gmail.com", password:"password")
  end
  scenario "with valid credentials" do 
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@user.full_name}")

  end  
end