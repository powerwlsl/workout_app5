require 'rails_helper'

RSpec.feature "Delete Exercise" do 
  before do 
    @user = User.create!(email:"example@gmail.com", password:"password")
    login_as(@user)
    @e1 = @user.exercises.create!(duration: 10, detail: "weight lifting", date: Date.today)    
  end
  scenario "with valid data succeeds" do 
    visit "/"
    click_link "My Lounge"

    click_link "Destroy"


    expect(page).to have_content("Exercise has been deleted")
    expect(page).not_to have_content(@e1)

  end

end