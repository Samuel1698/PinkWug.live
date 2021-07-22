require 'rails_helper'
Capybara.javascript_driver = :selenium_chrome_headless

RSpec.feature "user visits store", type: :feature, js: true do
  before do
    visit store_index_path
  end

  it "should display all products by collection"
  it "should collapse collections on click"
end
