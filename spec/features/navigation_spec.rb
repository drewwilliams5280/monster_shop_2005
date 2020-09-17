
require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Visitor' do
    it "I see a nav bar with links to all pages" do
      visit '/merchants'

      within 'nav' do
        click_link 'All Items'
      end

      expect(current_path).to eq('/items')
      within 'nav' do
        click_link 'Home'
      end

      expect(current_path).to eq('/')

      within 'nav' do
        click_link 'All Merchants'
      end

      expect(current_path).to eq('/merchants')
      within 'nav' do
        click_link 'Register'
      end

      expect(current_path).to eq('/register')
      within 'nav' do
        expect(page).to have_link('Login')
      end

    end

    it "I can see a cart indicator on all pages" do
      visit '/merchants'
      within 'nav' do
        expect(page).to have_content("Cart: 0")
      end

      visit '/items'

      within 'nav' do
        expect(page).to have_content("Cart: 0")
        click_link 'Cart'
        expect(current_path).to eq('/cart')
      end
    end
  end
end
