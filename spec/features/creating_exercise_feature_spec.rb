require 'rails_helper'

RSpec.feature "User signup" do 
  before do 
    @user = User.create!(email:"example@gmail.com", password:"password")
    login_as(@user)
  end
  scenario "with valid input" do 
    visit "/"
  end
  
end