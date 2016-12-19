require 'rails_helper'

RSpec.feature "Listing members" do 
  before do 
    @user1 = User.create!(first_name:"John",last_name:"Doe", email:"example@gmail.com", password:"password")
    @user2 = User.create!(first_name:"Jane",last_name:"Doe",email:"example2@gmail.com", password:"password")
    login_as(@user1)
  end

  scenario "shows a list of registered members" do 
    visit '/'
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@user1.full_name)
    expect(page).to have_content(@user2.full_name)

  end
end