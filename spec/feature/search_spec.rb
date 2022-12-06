require "rails_helper"

RSpec.feature "Search", type: :feature do
    scenario "User searches for a product" do
        visit "/analytics"
        expect(page).to have_content("Top")
        
    end

    scenario "User types in search" do
        visit "/search"
        fill_in "search", with: "Rich"
        click_button "Search"
        expect(page).to have_content("Trending Searches")
    end

    scenario "Last search is recorded" do
        visit "/search"
        fill_in "search", with: "Rich"
        fill_in "search", with: "Richa"
        click_button "Search"
        expect(page).to have_current_path("/search?search=Richa&commit=Search")
    end  
end