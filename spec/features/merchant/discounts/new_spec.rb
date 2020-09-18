require 'rails_helper'

RSpec.describe "As a merchant employee" do
  before :each do
      ItemOrder.destroy_all
      Order.destroy_all
      User.destroy_all
      Merchant.destroy_all
      Item.destroy_all
      @m1 = Merchant.create!(name: "Harry Potter Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))
      @m3 = Merchant.create!(name: "Breaking Bad Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))
      @m4 = Merchant.create!(name: "Music Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))

      @wand = @m1.items.create!(name: 'Wand', description: "Wand replica", price: 22, image: "https://images-na.ssl-images-amazon.com/images/I/61cWISkxk4L._AC_SL1500_.jpg", active?: true, inventory: 31 )
      @cloak = @m1.items.create!(name: 'Cloak', description: "Harry Potter cloak", price: 35, image: "https://images.beautifulhalo.com/images/392x588/201904/K/harry-potter-gryffindor-cosplay-costume-magic-robe-cloak-halloween-costumes-cape_1554311096436.jpg", active?: true, inventory: 11 )
      @tattoo = @m1.items.create!(name: 'Scar Tattoo', description: "Temporary Harry Potter tattoos", price: 3, image: "https://d2h1pu99sxkfvn.cloudfront.net/b0/5083776/339841950_B7PJv3ShYz/P0.jpg", active?: true, inventory: 250 )
      @bluray = @m1.items.create!(name: 'Blu Ray Box Set', description: "All of the movies", price: 35, image: "https://images-na.ssl-images-amazon.com/images/I/81weyEaCDsL._SL1500_.jpg", active?: true, inventory: 250 )
      @books = @m1.items.create!(name: 'Book Box Set', description: "All of the books", price: 33, image: "https://images-na.ssl-images-amazon.com/images/I/71rOzy4cyAL.jpg", active?: true, inventory: 19 )
      @broom = @m1.items.create!(name: 'Broom', description: "Broom replica", price: 19, image: "https://images-na.ssl-images-amazon.com/images/I/41K1kDMDHcL._AC_SX466_.jpg", active?: true, inventory: 13 )
      @snitch = @m1.items.create!(name: 'Snitch', description: "Snitch replica from quidditch", price: 65, image: "https://m2.mbl.is/PRVkEAWgTalstg5bEQ4KNMt1ucM=/758x505/smart/frimg/1/9/32/1093256.jpg", active?: true, inventory: 3 )

      @mugs = @m3.items.create!(name: 'BB Mugs', description: "Breaking Bad drinking mugs", price: 20, image: "https://cdn.shopify.com/s/files/1/1565/9935/products/bbdjfmug01_81c4a41e-add4-4312-abe0-36df7a091e07_large.jpg?v=1567148192", active?: true, inventory: 8 )
      @shirt = @m3.items.create!(name: 'Heisenberg Shirt', description: "Shirt featuring the character Heisenberg", price: 14, image: "https://cdn.shopify.com/s/files/1/1565/9935/products/bbdtvtat104_9e7cd0b0-40eb-4131-877c-620ea8207be0_1200x1200.jpg?v=1567148265", active?: true, inventory: 8 )
      @coozie = @m3.items.create!(name: 'Jesse Coozie', description: "Science!", price: 4, image: "https://static.redditgifts.com/images/uploaded/large-present/2013/12/30/breaking-bad-merch-1388410951.jpg", active?: true, inventory: 8 )

      @prince = @m4.items.create!(name: 'Prince Purple Rain Vinyl Album', description: "Purple Rain by Prince", price: 22, image: "https://target.scene7.com/is/image/Target/GUEST_0e0722ab-4c9a-46f3-96bb-2086468497bd?wid=488&hei=488&fmt=pjpeg", active?: true, inventory: 5 )
      @elvis = @m4.items.create!(name: "Elvis 45 (Blue Moon of Kentucky)", description: "Original 45 by one of the greats", price: 18, image: "https://www.popsike.com/pix/20050117/4068474731.jpg", active?: true, inventory: 2 )
      @muddy = @m4.items.create!(name: 'Muddy Waters Live at Newport', description: "Muddy's famous live performance from 1960", price: 26, image: "https://images-na.ssl-images-amazon.com/images/I/81ZPjQ77IML._SL1500_.jpg", active?: true, inventory: 4 )

      @regular_user = User.create!(name: "Scott Stapp", address: "1234 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "regular_user@email.com", password: "123", role: 0)
      @second_user = User.create!(name: "Drew Bob", address: "1 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "second_user@email.com", password: "123", role: 0)
      @third_user = User.create!(name: "Scooby Doo", address: "133 Main St.", city: "Denver", state: "CO", zip: "80085", email: "third_user@email.com", password: "123", role: 0)
      @fourth_user = User.create!(name: "Jerry McGuire", address: "14 Harry St.", city: "Denver", state: "CO", zip: "80085", email: "fourth_user@email.com", password: "123", role: 0)
      @m1_user = User.create!(name: "James Potter", address: "123 Diagon Alley", city: "Denver", state: "CO", zip: "80085", email: "m1_user@email.com", password: "123", role: 1, merchant_id: @m1.id)
      @m3_user = User.create!(name: "Walter White", address: "723 Hank St.", city: "Denver", state: "CO", zip: "80085", email: "m3_user@email.com", password: "123", role: 1, merchant_id: @m3.id)
      @m4_user = User.create!(name: "Roger Nelson", address: "20499 Raspberry Blvd.", city: "Denver", state: "CO", zip: "80085", email: "m4_user@email.com", password: "123", role: 1, merchant_id: @m4.id)
      visit '/'
      within ".topnav" do
        click_link("Login")
      end
      fill_in :email, with: @m1_user.email
      fill_in :password, with: @m1_user.password
      click_on "Submit"
    end

    it "can make new discounts" do
      visit '/merchant'
      click_on "View Discounts"
      click_on "Create Discount"
      fill_in :name, with: "5 / 10%"
      fill_in :quantity, with: "5"
      fill_in :percentage, with: "10"
      fill_in :item, with: @wand.name
      click_on "Submit"
      expect(current_path).to eq("/merchant")
      expect(Discount.all.first.name).to eq("5 / 10%")
      expect(Discount.all.first.quantity).to eq(5)
      expect(Discount.all.first.percentage).to eq(10)
      expect(Discount.all.first.item_id).to eq(@wand.id)
    end






  end
