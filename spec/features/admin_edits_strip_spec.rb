require 'rails_helper'

RSpec.feature "admin edits a strip", type: :feature do
  before do 
    # User can visit admin_root_path 
    visit admin_root_path
    # User can log in to admin dashboard
    fill_in "Email", with: "admin_test@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
  end
  scenario "successfully" do 
    # Visit index page
    visit admin_strips_path
    # Click on the edit button
    first('.table_actions').click_on "Edit"
    # Edit everything
    fill_in "Title", with: "Avocado (Collab with ThingsInSquares)"
    fill_in "Description", with: "Millenials and their student debt"
    fill_in "Keywords", with: "Student Debt, Loans, Millenials"
    attach_file('Image', "spec/images/avocado (collab with ThingsInSquares).png")
    fill_in "Transcript", with: "Pink Wug reading a headline from his laptop reading: How to pay off student loans... 'eat less avocado' highlighted among the text of the newspaper. Next panel is pink wug calculating, the phrase '12654 fewer avocados' appears among different equations. Next panel shows him vomiting an avocado and counting, saying 'that makes 31...' Next panel shows him handing a banker the keys to a truck full of avocados in the back, saying 'I'm paying off my debt please'"
    fill_in "Created in", with: "11/02/2021"
    click_on "Update Strip"
    # Validate presence of changes, new should be avocado
    expect(page).to have_css 'div', text: "Strip was successfully updated."
    expect(page).to have_css 'td', text: "Avocado (Collab with ThingsInSquares)"
    expect(page).to have_css 'td', text: "Millenials and their student debt"
    expect(page).to have_css 'td', text: "Student Debt, Loans, Millenials"
    expect(page).to have_css 'td', text: "Pink Wug reading a headline from his laptop reading: How to pay off student loans... 'eat less avocado' highlighted among the text of the newspaper. Next panel is pink wug calculating, the phrase '12654 fewer avocados' appears among different equations. Next panel shows him vomiting an avocado and counting, saying 'that makes 31...' Next panel shows him handing a banker the keys to a truck full of avocados in the back, saying 'I'm paying off my debt please'"
    expect(page).to have_css 'td', text: "Feb-11-2021"
    # Puts message to show that test was successful
    puts 'Strip edited successfully to Avocado (Collab with ThingsInSquares)'
  end
end
