require 'rails_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

RSpec.feature "user searches comics", type: :feature, js: true do
  before do 
    # Visit home page
    visit root_path
    # Click on search
    find('.search_toggle').click
    # Make sure the search form is active
    expect(page).to have_css('.search_form')
  end
  it "should display 3 union results on one word search" do 
    # Fill in the search form (input) with 'union'
    fill_in('query_text', with: 'Union').native.send_keys(:return)
    # Check that there are 3 rows
    within find('.table') do 
      expect(page).to have_css('.row', count: 3)
    end
  end
  it "should display 4 union LTV results on one word search"
end
