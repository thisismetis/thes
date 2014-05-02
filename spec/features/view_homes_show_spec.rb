require 'spec_helper.rb'

feature "visit show page" do
  scenario "see sign up form" do
    visit root_path
    expect(page).to have_selector "title", text: "Thes", visible: false
    expect(page).to have_content "Welcome to Thes"
  end
end
