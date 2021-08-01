require 'rails_helper'

RSpec.feature "comic navigation", type: :feature do
  before do 
    # Visit latest comic
    visit root_path
  end
  it "should have disabled links on rooth path" do 
    within('.comic_Nav') do 
      # Expect the last two arrows to be div with disabled class
      expect(page).to have_no_css('a.last')
      expect(page).to have_no_css('a.next')
      
      expect(page).to have_css('div.disabled')
      expect(page).to have_css('div.disabled')
    end
  end
  it "should navigate to previous page on click" do 
    # Click on previous link
    find('.prev', match: :first).click
    # Verify that it's the previous comic. 
    expect(page).to have_css 'h1', text: "On this day was born an OG leftists memer who wrote not walls, but whole buildings of text"
    # Click on next link
    find('.next', match: :first).click 
    # Verify that it's the next comic
    expect(page).to have_css 'h1', text: "Union for me, but not for thee"
    # Click on random link
    find('.random', match: :first).click
    # Veirfy that link is different than the current one
    expect(page).to_not have_css 'h1', text: "Union for me, but not for thee"
  end
  it "should navigate to first page on click and have disabled links" do 
    # Click first link
    find('.first', match: :first).click 
    # Verify that it's the content that's supposed to be there
    expect(page).to have_css 'h1', text: "GameStops stocks Hedge funds and rWallstreetsbets explained"
    # Verify that the arrows are disabled
     within('.comic_Nav') do
      expect(page).to have_no_css('a.first')
      expect(page).to have_no_css('a.prev')
      
      expect(page).to have_css('div.disabled')
      expect(page).to have_css('div.disabled')
    end
    # Click on latest link
    find('.last', match: :first).click 
    # Verify that it's the content that's supposed to be there
    expect(page).to have_css 'h1', text: "Union for me, but not for thee"
    # Verify that the arrows are disabled
    within('.comic_Nav') do
      expect(page).to have_no_css('a.last')
      expect(page).to have_no_css('a.next')
      
      expect(page).to have_css('div.disabled')
      expect(page).to have_css('div.disabled')
    end
  end
end