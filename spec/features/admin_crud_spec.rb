require 'rails_helper'

RSpec.feature "admin CRUD", type: :feature do
  before do 
    # User can visit admin_root_path 
    visit admin_root_path
    # User can log in to admin dashboard
    fill_in "Email", with: "admin_test@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    # User creates new strip 
    visit new_admin_strip_path

    fill_in "Title", with: "Relatable"
    fill_in "Description", with: "My reaction when someone says they relate to my comics"
    fill_in "Tags", with: "Non-political, Yellow"
    attach_file('Image', "spec/images/Relatable.jpg")
    fill_in "Transcript", with: "Yellow wug says 'I relate so much to your comics'.
    Pink wug replies: damn I'm sorry to hear that"
    fill_in "Created In", with: "29/04/2021"

    click_on "Create Strip"
  end
  it "creates new strip" do 
    #Validate that strip was created
    within('table') do 
      expect(page).to have_text("Relatable")
      expect(page).to have_css('img')
    end
    # Puts message to show that test was successful
    puts 'Strip "Relatable" created successfully'
  end
  it "edits new strip" do
    # Click on Edit Strip
    click_on("Edit Strip")
    # Edit everything 
    fill_in "Title", with: "Avocado (Collab with ThingsInSquares)"
    fill_in "Description", with: "Millenials and their student debt"
    fill_in "Tags", with: "Student Debt, Loans, Millenials"
    attach_file('Image', "spec/images/avocado (collab with ThingsInSquares).png")
    fill_in "Transcript", with: "Pink Wug reading a headline from his laptop reading: How to pay off student loans... 'eat less avocado' highlighted among the text of the newspaper. Next panel is pink wug calculating, the phrase '12654 fewer avocados' appears among different equations. Next panel shows him vomiting an avocado and counting, saying 'that makes 31...' Next panel shows him handing a banker the keys to a truck full of avocados in the back, saying 'I'm paying off my debt please'"
    fill_in "Created In", with: "11/02/2021"
    click_on "Update Strip"
    # Validate presence of changes, new should be avocado
    expect(page).to have_text("Strip was successfully updated.")
    within('table') do 
      expect(page).to have_text("Avocado (Collab with ThingsInSquares)")
      expect(page).to have_text("Millenials and their student debt")
      expect(page).to have_text("Student Debt, Loans, Millenials")
      expect(page).to have_css('img')
      expect(page).to have_text("Pink Wug reading a headline from his laptop reading: How to pay off student loans... 'eat less avocado' highlighted among the text of the newspaper. Next panel is pink wug calculating, the phrase '12654 fewer avocados' appears among different equations. Next panel shows him vomiting an avocado and counting, saying 'that makes 31...' Next panel shows him handing a banker the keys to a truck full of avocados in the back, saying 'I'm paying off my debt please'")
      expect(page).to have_text("Feb 11 2021")
    end
    # Puts message to show that test was successful
    puts 'Strip "Relatable" edited successfully to "Avocado"'
  end
  it "deletes new strip" do 
    # Click on Delete Strip button
    click_on("Delete Strip")
    # Validate that strip was deleted
    expect(page).to have_text("Strip was successfully destroyed.")
    within('table') do 
      expect(page).to_not have_text("Relatable")
    end
    # Puts message to show that test was successful
    puts 'Strip "Relatable" was successfully destroyed'
  end
end
