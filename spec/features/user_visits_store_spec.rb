require 'rails_helper'

RSpec.feature "user visits store", type: :feature, js: true do
  before do
    # User visits store page
    visit store_index_path
  end
  it "should display all products by collection" do
    # Check that at least one Product exists under Mugs
    # within page.all('.collection')[0] do
    #   find('product', match: :first).have_text("fuck capitalism")
    # end
    # Check that at least one Product exists under Clothes
    # Check that at least one Product exists under Stickers
    # Check that at least one Product exists under Prints
  end
  it "should collapse collections on click"
    # Find Mugs button
    # Check that it collapsed
    # Find Clothes button
    # Check that it collapsed
    # Find Stickers button
    # Check that it collapsed
    # Find Prints button
    # Check that it collapsed
end
