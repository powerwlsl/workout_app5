require 'rails_helper'

RSpec.feature "Create Exercise" do 
  before do 
    @user1 = User.create!(first_name:"John",last_name:"Doe",email:"example@gmail.com", password:"password")
    @user2 = User.create!(first_name:"Jane",last_name:"Doe",email:"example2@gmail.com", password:"password")

    login_as(@user1)
    @following = Following.create(user: @user1,friend: @user2)
    @e1 = @user1.exercises.create!(duration: 10, detail: "weight lifting", date: Date.today)
    @e2 = @user1.exercises.create!(duration: 55, detail: "running", date: 2.days.ago)
    @e3 = @user1.exercises.create!(duration: 25, detail: "jumping", date: 10.days.ago)

  end
  scenario "shows user's workout for last 7 days" do 
    visit '/'
    click_link "My Lounge"

    expect(page).to have_content(@e1.duration)
    expect(page).to have_content(@e1.date)
    expect(page).to have_content(@e1.detail)

    expect(page).to have_content(@e2.duration)
    expect(page).to have_content(@e2.date)
    expect(page).to have_content(@e2.detail)

    expect(page).not_to have_content(@e3.duration)
    expect(page).not_to have_content(@e3.date)
    expect(page).not_to have_content(@e3.detail)
  end

  scenario "shows no exercises if none created" do 
    @user1.exercises.delete_all
    visit '/'
    click_link "My Lounge"

    expect(page).not_to have_content(@e1.duration)
    expect(page).not_to have_content(@e1.date)
    expect(page).not_to have_content(@e1.detail)

    expect(page).not_to have_content(@e2.duration)
    expect(page).not_to have_content(@e2.date)
    expect(page).not_to have_content(@e2.detail)
  end

  scenario "shows a list of user's friends" do 
    visit '/'
    click_link "My Lounge"
    expect(page).to have_content("My friends")
    expect(page).to have_link(@user2.full_name)
    expect(page).to have_link("Unfollow")

  end

end