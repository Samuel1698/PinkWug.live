require 'rails_helper'

RSpec.feature "archive", type: :feature, js: true do
  before do 
    visit strips_path
  end
  it "should display gallery view" do 
    # Check if div table has gallery class
    expect(page).to have_css('.table.gallery')
  end
  it "should display table view" do 
    # Find toggle button (wait for it to load), then click on it
    find('.toggle').click
    # Expect div to have line class
    expect(page).to have_css('.line')
    # Expect page to NOT have gallery
    expect(page).to_not have_css('.table.gallery')
  end
  it "should toggle title & date order" do 
    # Click on toggle button
    find('.toggle').click
    # Click on Title
    find('.title', match: :first).click 
    # Within second Row, check the title's content
    within page.all('.row')[1] do
      expect(page).to have_text("GameStops stocks Hedge funds and rWallstreetsbets explained")
    end
    # Click on Title again
    find('.title', match: :first).click
    # Within second Row, check the title's content
    within page.all('.row')[1] do
      expect(page).to have_text("Why nurses are superheroes")
    end
    # Click on Date
    find('.date', match: :first).click
    # Within second Row, check the date's order
    within page.all('.row')[1] do
      expect(page).to have_text("01/27/2021")
    end
    # Click on Date again
    find('.date', match: :first).click
    # Within second Row, check the date's order
    within page.all('.row')[1] do
      expect(page).to have_text("05/07/2021")
    end
  end
end