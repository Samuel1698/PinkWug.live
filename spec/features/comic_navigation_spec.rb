require 'rails_helper'

RSpec.feature "comic navigation", type: :feature do
  before do 
    # Visit latest comic
    visit root_path
  end
  it "should have disabled links on rooth path" do 
    # Check that last two arrows are disabled
    first('.fa-angle-double-right').has_css?('.disabled')
    first('.fa-angle-right').has_css?('.disabled')
  end
  it "should navigate to previous page on click" do 
    # Click on previous link
    first('.fa-angle-left').click
    # Verify that it's the previous comic. 
    expect(page).to have_css 'h1', text: "On this day was born an OG leftists memer who wrote not walls, but whole buildings of text"
    # Click on next link
    first('.fa-angle-right').click 
    # Verify that it's the next comic
    expect(page).to have_css 'h1', text: "Union for me, but not for thee"
    # Click on random link
    first('.fa-rotate-right').click
    # Veirfy that link is different than the current one
    expect(page).to_not have_css 'h1', text: "Union for me, but not for thee"
  end
  it "should navigate to first page on click and have disabled links" do 
    # Click first link
    first('.fa-angle-double-left').click 
    # Verify that it's the content that's supposed to be there
    expect(page).to have_css 'h1', text: "GameStops stocks Hedge funds and rWallstreetsbets explained"
    # Verify that the arrows are disabled
    first('.fa-angle-double-left').has_css?('.disabled')
    first('.fa-angle-left').has_css?('.disabled')
    # Click on latest link
    first('.fa-angle-double-right').click 
    # Verify that it's the content that's supposed to be there
    expect(page).to have_css 'h1', text: "Union for me, but not for thee"
    # Verify that the arrows are disabled
    first('.fa-angle-double-right').has_css?('.disabled')
    first('.fa-angle-right').has_css?('.disabled')
  end
end
