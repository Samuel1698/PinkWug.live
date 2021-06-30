require 'rails_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

RSpec.feature "user visits store", type: :feature, js: true do
  before do
    # User visits store page
    visit store_index_path
  end
  it "should display all products by collection" do
    # Check that at least one Product exists under Mugs
    within find('.collection.mugs', match: :first) do
      within find('.product', match: :first) do 
        expect(page).to have_text("fuck capitalism")
      end
    end
    # Check that at least one Product exists under Clothes
    within find('.collection.clothes', match: :first) do
      within find('.product', match: :first) do 
        expect(page).to have_text("the pinkest hoodie")
      end
    end
    # Check that at least one Product exists under Stickers
    within find('.collection.stickers', match: :first) do
      within find('.product', match: :first) do 
        expect(page).to have_text("the baron")
      end
    end
    # Check that at least one Product exists under Prints
    within find('.collection.prints', match: :first) do
      within find('.product', match: :first) do 
        expect(page).to have_text("general strike")
      end
    end
  end
  it "should collapse collections on click" do
    # Find Mugs button
    find_by_id('mugs').click
    # Expect the collection element to not be present
    expect(page).to_not have_css('.collection.mugs')
    # Click button again
    find_by_id('mugs').click
    # Expect the collection element to be present
    expect(page).to have_css('.collection.mugs')


    # Find Clothes button
    find_by_id('clothes').click
    # Expect the collection element to not be present
    expect(page).to_not have_css('.collection.clothes')
    # Click button again
    find_by_id('clothes').click
    # Expect the collection element to be present
    expect(page).to have_css('.collection.clothes')


    # Find Stickers button
    find_by_id('stickers').click
    # Expect the collection element to not be present
    expect(page).to_not have_css('.collection.stickers')
    # Click button again
    find_by_id('stickers').click
    # Expect the collection element to be present
    expect(page).to have_css('.collection.stickers')

    
    # Find Prints button
    find_by_id('prints').click
    # Expect the collection element to not be present
    expect(page).to_not have_css('.collection.prints')
    # Click button again
    find_by_id('prints').click
    # Expect the collection element to be present
    expect(page).to have_css('.collection.prints')
  end
end
