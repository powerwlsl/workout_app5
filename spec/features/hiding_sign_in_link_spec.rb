require 'rails_helper'

RSpec.feature "Hiding a sign in link " do 
  before do 
    @user = User.create!(email:"example@gmail.com", password:"password")
  end

  scenario "upon successful signin" do 
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: "example@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    expect(page).not_to have_content("Sign in")
    expect(page).not_to have_content("Sign up")
    expect(page).to have_content("Sign out")
  end
end
