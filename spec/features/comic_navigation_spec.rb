require 'rails_helper'

RSpec.feature "comic navigation", type: :feature do
  before do 
    # Visit latest comic
    visit root_path
  end
  it "should have disabled links on rooth path" do 
    # Check that last two arrows are disabled
    find('.fa-angle-double-right', match: :first).has_css?('.disabled')
    find('.fa-angle-right', match: :first).has_css?('.disabled')
  end
  it "should navigate to previous page on click" do 
    # Click on previous link
    find('.fa-angle-left', match: :first).click
    # Verify that it's the previous comic. 
    expect(page).to have_css 'h1', text: "On this day was born an OG leftists memer who wrote not walls, but whole buildings of text"
    # Click on next link
    find('.fa-angle-right', match: :first).click 
    # Verify that it's the next comic
    expect(page).to have_css 'h1', text: "Union for me, but not for thee"
    # Click on random link
    find('.fa-rotate-right', match: :first).click
    # Veirfy that link is different than the current one
    expect(page).to_not have_css 'h1', text: "Union for me, but not for thee"
  end
  it "should navigate to first page on click and have disabled links" do 
    # Click first link
    find('.fa-angle-double-left', match: :first).click 
    # Verify that it's the content that's supposed to be there
    expect(page).to have_css 'h1', text: "GameStops stocks Hedge funds and rWallstreetsbets explained"
    # Verify that the arrows are disabled
    find('.fa-angle-double-left', match: :first).has_css?('.disabled')
    find('.fa-angle-left', match: :first).has_css?('.disabled')
    # Click on latest link
    find('.fa-angle-double-right', match: :first).click 
    # Verify that it's the content that's supposed to be there
    expect(page).to have_css 'h1', text: "Union for me, but not for thee"
    # Verify that the arrows are disabled
    find('.fa-angle-double-right', match: :first).has_css?('.disabled')
    find('.fa-angle-right', match: :first).has_css?('.disabled')
  end
end