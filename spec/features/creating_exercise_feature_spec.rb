require 'rails_helper'

RSpec.feature "Create Exercise" do 
  before do 
    @user = User.create!(email:"example@gmail.com", password:"password")
    login_as(@user)
  end
  scenario "with valid input" do 
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"

    expect(page).to have_link("Back")
    fill_in "Duration", with: 70
    fill_in "Detail", with: "Weight lifting"
    fill_in "Date", with: "2016-07-26"

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")
    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@user,exercise))   
    expect(exercise.user_id).to eq(@user.id)
  end
  
  scenario "with invalid input" do 
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"

    expect(page).to have_link("Back")
    fill_in "Duration", with: ""
    fill_in "Detail", with: ""
    fill_in "Date", with: ""

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration can't be blank")
    expect(page).to have_content("Detail can't be blank")
    expect(page).to have_content("Date can't be blank")

  end
end