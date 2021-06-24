require 'rails_helper'

RSpec.feature "comic navigation", type: :feature do
  it "should disabled links on rooth path" do 
    # Visit latest comic
    visit root_path
    # Check that last two arrows are disabled
    first('.fa-angle-double-right').has_css?('.disabled')
    first('.fa-angle-right').has_css?('.disabled')
  end
  it "should navigate to previous page on click"
  it "should navigate to next page on click"
  it "should navigate to random page that's different than current"
  it "should navigate to first page on click and have disabled links"
  it "should navigate to last page on click and have disabled links"
end
