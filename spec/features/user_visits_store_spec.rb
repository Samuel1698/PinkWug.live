require 'rails_helper'

RSpec.feature "user visits store", type: :feature, js: true do
  before do
    VCR.use_cassette('shopify') do 
      uri = URI.parse("https://#{ENV['SHOPIFY_API_LINK']}/admin/api/2021-07/graphql.json")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/graphql"
      request["X-Shopify-Access-Token"] = "#{ENV['SHOPIFY_API_SECRET']}"
      request.body = "
        {
          collections(first: 10) {
            edges {
              node {
                title
                id
                products(first: 12) {
                  edges {
                    node {
                      id
                      title
                      handle
                      featuredImage {
                        originalSrc
                      }
                      variants(first: 1) {
                        edges {
                          node {
                            price
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        "
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      JSON.parse(response.body)
    end
    # User visits store page
    visit store_index_path
  end

  it "should display all products by collection", :vcr do
    # Get all collections
    collections = page.all(".collection")

    # Check that the correct Product exists under Mugs
    within collections[0] do 
      within find('.product', match: :first) do 
        expect(page).to have_text("trans liberation now")
      end
    end
    # Check that the correct Product exists under Clothes
    within collections[1] do 
      within find('.product', match: :first) do 
        expect(page).to have_text("the pinkest hoodie")
      end
    end
    # Check that the correct Product exists under Prints
    within collections[2] do 
      within find('.product', match: :first) do 
        expect(page).to have_text("general strike")
      end
    end
    # Check that the correct Product exists under Stickers
    within collections[3] do 
      within find('.product', match: :first) do 
        expect(page).to have_text("the baron")
      end
    end
  end
  it "should collapse collections on click", :vcr do
    # Get all buttons
    buttons = page.all(".collection_button")

    # Find Mugs button
    buttons[0].click
    # Expect the collection element to not be present
    expect(page).to_not have_text('trans liberation now')
    # Click button again
    buttons[0].click
    # Expect the collection element to be present
    expect(page).to have_text('trans liberation now')


    # Find Clothes button
    buttons[1].click
    # Expect the collection element to not be present
    expect(page).to_not have_text('the pinkest hoodie')
    # Click button again
    buttons[1].click
    # Expect the collection element to be present
    expect(page).to have_text('the pinkest hoodie')


    # Find Prints button
    buttons[2].click
    # Expect the collection element to not be present
    expect(page).to_not have_text('general strike')
    # Click button again
    buttons[2].click
    # Expect the collection element to be present
    expect(page).to have_text('general strike')

    
    # Find Sticker button
    buttons[3].click
    # Expect the collection element to not be present
    expect(page).to_not have_text('the baron')
    # Click button again
    buttons[3].click
    # Expect the collection element to be present
    expect(page).to have_text('the baron')
  end
end
