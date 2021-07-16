require 'rails_helper'
Capybara.javascript_driver = :selenium_chrome_headless

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
    fill_in('query_text', with: 'Union')
    # Click on submit button
    find('.submit_button').click
    # Check that there are 3 rows
    within find('.table') do 
      expect(page).to have_css('.row', count: 3)
    end
  end
  it "should display 4 results on 'Union LTV' search" do 
    # Fill in the search form with 'union LTV'
    fill_in('query_text', with: 'Union LTV')
    # Click on submit button
    find('.submit_button').click
    # Check that there are 4 rows
    within find('.table') do 
      expect(page).to have_css('.row', count: 4)
    end
  end
  it "should display 4 results on 'Union and LTV search" do 
    # Fill in the search form with 'union LTV'
    fill_in('query_text', with: 'Union LTV')
    # Click on submit button
    find('.submit_button').click
    # Check that there are 4 rows
    within find('.table') do 
      expect(page).to have_css('.row', count: 4)
    end
  end
end
