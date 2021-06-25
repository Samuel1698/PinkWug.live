require 'rails_helper'

RSpec.feature "admin creates new strip", type: :feature do
  before do 
    # User can visit admin_root_path 
    visit admin_root_path
    # User can log in to admin dashboard
    fill_in "Email", with: "admin_test@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
  end
  scenario "successfully" do 
    # User creates new strip 
    visit new_admin_strip_path

    fill_in "Title", with: "Relatable"
    fill_in "Description", with: "My reaction when someone says they relate to my comics"
    fill_in "Keywords", with: "Non-political, Yellow"
    attach_file('Image', "spec/images/Relatable.jpg")
    fill_in "Transcript", with: "Yellow wug says 'I relate so much to your comics'.
    Pink wug replies: damn I'm sorry to hear that"
    fill_in "Created in", with: "29/04/2021"

    click_on "Create Strip"

    #Validate that strip was created
    expect(page).to have_css 'div', text: "Strip was successfully created."
    expect(page).to have_css 'td', text: "Relatable"
    # Puts message to show that test was successful
    puts 'Strip Relatable created successfully'

  end
  scenario "unsuccessfully" do 
    visit new_admin_strip_path
    click_on "Create Strip"
    #Validate that cant create strip with empty fields
    expect(page).to have_css 'p', text: "can't be blank"
  end
end
