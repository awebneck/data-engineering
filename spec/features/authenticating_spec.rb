require 'rails_helper'

feature 'authenticating as a user' do
  let!(:user) { FactoryGirl.create :user, email: 'somebody@mailinator.com', password: 'password', password_confirmation: 'password'}

  scenario 'User attemps to log in with valid information' do
    visit '/login'
    fill_in 'Email', :with => 'somebody@mailinator.com'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
    expect(page).to have_content 'Please upload the data file below'
  end

  scenario 'User attemps to log in with invalid information' do
    visit '/login'
    fill_in 'Email', :with => 'youforgotosaythemagicword@mailinator.com'
    fill_in 'Password', :with => 'aintnobodygottimeforthat'
    click_on 'Login'
    expect(page).not_to have_content 'Please upload the data file below'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'User attempts to log in again once already authenticated' do
    login user
    expect(current_path).not_to eq login_path
    expect(page).to have_content 'Please upload the data file below'
  end
end
