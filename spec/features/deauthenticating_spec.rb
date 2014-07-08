require 'rails_helper'

feature 'deauthenticating' do
  let!(:user) { FactoryGirl.create :user, email: 'somebody@mailinator.com', password: 'password', password_confirmation: 'password'}

  scenario 'User attemps to log out when logged in' do
    login user
    expect(page).to have_link 'Logout'
    click_link 'Logout'
    expect(page).to have_field 'Email'
    expect(page).not_to have_content 'Please upload the data file below'
  end

  scenario 'Anonymous user attempts to log out' do
    visit '/'
    expect(page).not_to have_link 'Logout'
  end
end
