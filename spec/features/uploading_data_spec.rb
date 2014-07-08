require 'rails_helper'

feature 'Uploading data' do
  scenario 'An authenticated user uploads a data file of the given format' do
    login
    attach_file('Data file', "#{Rails.root}/spec/resources/example_input.tab")
    click_button 'Upload'
    expect(page).to have_content 'Gross Revenue: $95.00'
  end
end
