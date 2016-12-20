require 'rails_helper'

RSpec.feature "shows friend's workout" do 
  before do 
    @user1 = User.create!(first_name:"John",last_name:"Doe",email:"example@gmail.com", password:"password")
    @user2 = User.create!(first_name:"Jane",last_name:"Doe",email:"example2@gmail.com", password:"password")

    login_as(@user1)
    @following = Following.create(user: @user1,friend: @user2)
    @e1 = @user2.exercises.create!(duration: 10, detail: "weight lifting", date: Date.today)
    @e2 = @user2.exercises.create!(duration: 55, detail: "running", date: 2.days.ago)
    @e3 = @user2.exercises.create!(duration: 25, detail: "jumping", date: 10.days.ago)
  end

  scenario "shows friend's workout for last 7 days" do
    visit "/"

    click_link "My Lounge"
    click_link @user2.full_name

    expect(page).to have_content(@user2.full_name + "'s Exercises")
    expect(page).to have_content(@e1.detail)
    expect(page).not_to have_content(@e3.detail)
    expect(page).to have_css("div#chart")
  end
end