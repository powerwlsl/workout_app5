require 'rails_helper'

RSpec.feature "unfollow friends" do 
  before do 
    @user1 = User.create!(first_name:"John",last_name:"Doe", email:"example@gmail.com", password:"password")
    @user2 = User.create!(first_name:"Jane",last_name:"Doe",email:"example2@gmail.com", password:"password")
    login_as(@user1)
    @following = Following.create(user: @user1,friend: @user2)

  end

  scenario do 
    visit "/"
    click_link "My Lounge"
    

  end

end