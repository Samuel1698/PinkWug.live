require 'rails_helper'

RSpec.feature "user visits admin page", type: :feature do
  scenario "successfully" do
    # User can visit admin_root_path 
    visit admin_root_path
    # User can log in to admin dashboard
    fill_in "Email", with: "admin_test@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    # Message should be 'signed in successfully'
    expect(page).to have_css 'h2', text: "Dashboard"
  end
end
