require 'rails_helper'

RSpec.feature "Listing members" do 
  before do 
    @user1 = User.create!(first_name:"John",last_name:"Doe", email:"example@gmail.com", password:"password")
    @user2 = User.create!(first_name:"Jane",last_name:"Doe",email:"example2@gmail.com", password:"password")
    login_as(@user1)
  end
end