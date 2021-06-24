require 'rails_helper'

RSpec.feature "user visits homepage" do
  scenario "successfully" do 
    # Visit front page
    visit root_path
    # Verify that page has a the latest comic
    expect(page).to have_css('.comic' + '.last')
  end
end
