require 'rails_helper'

RSpec.feature "user visits homepage" do
  scenario "successfully" do 
    # Visit front page
    visit root_path
    # Verify that page has a comic
    expect(page).to have_css('.comic')
    # Verify comic shown is last one uploaded
    expect(page).to have_css 'h1', text: 'Union for me, but not for thee'
  end
end
