require 'rails_helper'
Capybara.javascript_driver = :selenium_chrome_headless

# RSpec.feature "store", type: :feature, js: true do
#   before do
#     visit store_index_path
#   end
#   it "should display only the clothes collection" do 
#     expect(page).to have_css("#collection-clothes.active")
#     expect(page).to have_no_css("#collection-mugs.active")
#     expect(page).to have_no_css("#collection-stickers.active")
#     expect(page).to have_no_css("#collection-prints.active")
#   end
#   it "should display only the clothes button as active" do 
#     expect(page).to have_css("#clothes.active")
#     expect(page).to have_no_css("#mugs.active")
#     expect(page).to have_no_css("#stickers.active")
#     expect(page).to have_no_css("#prints.active")
#   end
#   it "buttons should switch between all collections" do 
#     # Click on mugs button
#     find_by_id("mugs").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#collection-mugs.active")
#     # Make sure all other collections are inactive
#     expect(page).to have_no_css("#collection-clothes.active")
#     expect(page).to have_no_css("#collection-stickers.active")
#     expect(page).to have_no_css("#collection-prints.active")

#     # Click on stickers button
#     find_by_id("stickers").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#collection-stickers.active")
#     # Make sure all other collections are inactive
#     expect(page).to have_no_css("#collection-clothes.active")
#     expect(page).to have_no_css("#collection-mugs.active")
#     expect(page).to have_no_css("#collection-prints.active")

#     # Click on prints button
#     find_by_id("prints").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#collection-prints.active")
#     # Make sure all other collections are inactive
#     expect(page).to have_no_css("#collection-clothes.active")
#     expect(page).to have_no_css("#collection-mugs.active")
#     expect(page).to have_no_css("#collection-stickers.active")

#     # Click on clothes button
#     find_by_id("clothes").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#collection-clothes.active")
#     # Make sure all other collections are inactive
#     expect(page).to have_no_css("#collection-mugs.active")
#     expect(page).to have_no_css("#collection-stickers.active")
#     expect(page).to have_no_css("#collection-prints.active")
#   end
#   it "buttons should switch to active states once clicked" do 
#     # Click on mugs button
#     find_by_id("mugs").click
#     # Expect button to have the 'active' state
#     expect(page).to have_css("#mugs.active")
#     # Make sure all other buttons are inactive
#     expect(page).to have_no_css("#clothes.active")
#     expect(page).to have_no_css("#stickers.active")
#     expect(page).to have_no_css("#prints.active")

#     # Click on stickers button
#     find_by_id("stickers").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#stickers.active")
#     # Make sure all other buttons are inactive
#     expect(page).to have_no_css("#clothes.active")
#     expect(page).to have_no_css("#mugs.active")
#     expect(page).to have_no_css("#prints.active")

#     # Click on prints button
#     find_by_id("prints").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#prints.active")
#     # Make sure all other buttons are inactive
#     expect(page).to have_no_css("#clothes.active")
#     expect(page).to have_no_css("#mugs.active")
#     expect(page).to have_no_css("#stickers.active")

#     # Click on clothes button
#     find_by_id("clothes").click
#     # Expect page to have the mug collection active and everything else inactive
#     expect(page).to have_css("#clothes.active")
#     # Make sure all other buttons are inactive
#     expect(page).to have_no_css("#mugs.active")
#     expect(page).to have_no_css("#stickers.active")
#     expect(page).to have_no_css("#prints.active")
#   end
#   it "expect each collection to have at least one product" do 
#     # Check that there's a product within clothes collection
#     within("#collection-clothes") do 
#       expect(page).to have_css(".shopify-buy__product")
#     end
#     # Click on mugs button
#     find_by_id("mugs").click
#     # Check that there's a product within mugs collection
#     within("#collection-mugs") do 
#       expect(page).to have_css(".shopify-buy__product")
#     end
#     # Click on mugs button
#     find_by_id("stickers").click
#     # Check that there's a product within stickers collection
#     within("#collection-stickers") do 
#       expect(page).to have_css(".shopify-buy__product")
#     end
#     # Click on mugs button
#     find_by_id("prints").click
#     # Check that there's a product within prints collection
#     within("#collection-prints") do 
#       expect(page).to have_css(".shopify-buy__product")
#     end
#   end
#   it "should activate modal when any product is clicked" do
#     # Expect the modal to be hidden
#     expect(page).to have_no_css(".shopify-buy-frame--modal")
#     # Click on a product
#     find(".shopify-buy__btn", match: :first).click
#     # Expect modal to show be active and show the same product
#     expect(page).to have_css(".shopify-buy-frame--modal.is-block")
#   end
# end
