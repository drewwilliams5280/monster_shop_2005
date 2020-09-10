require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @regular_user = User.create!(name: "Larry", address: "1236", city: "Denver", state: "CO", zip: "80212", email: "regular_user@email.com", password: "123", role: 0)
    @merchant_user = User.create!(name: "Curly", address: "1235", city: "Denver", state: "CO", zip: "80222", email: "merchant_user@email.com", password: "123", role: 1)
    @admin_user = User.create!(name: "Moe", address: "1234", city: "Denver", state: "CO", zip: "88442", email: "admin_user@email.com", password: "123", role: 2)
  end
  describe "After I login" do
    it "As a regular user, I am redirected to my profile page" do
      
      visit "/merchants"
      
      within '.topnav' do
        click_on "Login"
      end
      
      expect(current_path).to eq("/login")
      
      fill_in :email, with: "#{@regular_user.email}"
      fill_in :password, with: "#{@regular_user.password}"
      
      click_on "Submit"
      
      expect(current_path).to eq("/profile")
      expect(page).to have_content("Success, you are now logged in as #{@regular_user.name}")

    end
    
    it "As a merchant user, I am redirected to my merchant dashboard page" do

      visit "/merchants"
      
      within '.topnav' do
        click_on "Login"
      end
      
      expect(current_path).to eq("/login")
      
      fill_in :email, with: "#{@merchant_user.email}"
      fill_in :password, with: "#{@merchant_user.password}"
      
      click_on "Submit"
      
      expect(current_path).to eq("/merchant")
      expect(page).to have_content("Success, you are now logged in as #{@merchant_user.name}")

    end
    
    it "As an admin user, I am redirected to my admin dashboard page" do

      visit "/merchants"
      
      within '.topnav' do
        click_on "Login"
      end
      
      expect(current_path).to eq("/login")
      
      fill_in :email, with: "#{@admin_user.email}"
      fill_in :password, with: "#{@admin_user.password}"
      
      click_on "Submit"
      
      expect(current_path).to eq("/admin")
      expect(page).to have_content("Success, you are now logged in as #{@admin_user.name}")

    end
  end
  
  describe "When I attempt to login" do
    it "I provide an incorrect password and am denied login access" do
      visit "/merchants"
      
      within '.topnav' do
        click_on "Login"
      end
      
      expect(current_path).to eq("/login")
      
      fill_in :email, with: "#{@admin_user.email}"
      fill_in :password, with: "wrong_password"
      
      click_on "Submit"
      
      expect(current_path).to eq("/login")
      expect(page).to have_content("Your login credentials are incorrect")

    end
    
    it "I provide an incorrect email and am denied login access" do
      visit "/merchants"
      
      within '.topnav' do
        click_on "Login"
      end
      
      expect(current_path).to eq("/login")
      
      fill_in :email, with: "g@email.com"
      fill_in :password, with: "#{@admin_user.password}"
      
      click_on "Submit"
      
      expect(current_path).to eq("/login")
      expect(page).to have_content("Your login credentials are incorrect")

    end
  end
end



#
# User Story 14, User cannot log in with bad credentials
#
# As a visitor
# When I visit the login page ("/login")
# And I submit invalid information
# Then I am redirected to the login page
# And I see a flash message that tells me that my credentials were incorrect
# I am NOT told whether it was my email or password that was incorrect





