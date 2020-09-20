require 'rails_helper'

describe Merchant, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe "relationships" do
    it {should have_many :items}
    it {should have_many(:item_orders).through(:items)}
  end

  describe 'instance methods' do
    before(:each) do
      @meg = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @tire = @meg.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)
    end
    it 'no_orders' do
      expect(@meg.no_orders?).to eq(true)
      regular_user = User.create!(name: "Harry Richard", address: "1234 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "regular_user@email.com", password: "123", role: 0)

      order_1 = regular_user.orders.create!(name: 'Meg', address: '123 Stang Ave', city: 'Hershey', state: 'PA', zip: 17033)
      item_order_1 = order_1.item_orders.create!(status: "pending", item: @tire, price: @tire.price, quantity: 2)

      expect(@meg.no_orders?).to eq(false)
    end

    it 'item_count' do
      chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 30, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 22)

      expect(@meg.item_count).to eq(2)
    end

    it 'average_item_price' do
      chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 40, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 22)

      expect(@meg.average_item_price).to eq(70)
    end

    it 'distinct_cities' do
      chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 40, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 22)
      regular_user = User.create!(name: "Harry Richard", address: "1234 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "regular_user@email.com", password: "123", role: 0)
      order_1 = regular_user.orders.create!(name: 'Meg', address: '123 Stang Ave', city: 'Hershey', state: 'PA', zip: 17033)
      order_2 = regular_user.orders.create!(name: 'Brian', address: '123 Brian Ave', city: 'Denver', state: 'CO', zip: 17033)
      order_3 = regular_user.orders.create!(name: 'Dao', address: '123 Mike Ave', city: 'Denver', state: 'CO', zip: 17033)
      order_1.item_orders.create!(status: "pending", item: @tire, price: @tire.price, quantity: 2)
      order_2.item_orders.create!(status: "pending", item: chain, price: chain.price, quantity: 2)
      order_3.item_orders.create!(status: "pending", item: @tire, price: @tire.price, quantity: 2)

      expect(@meg.distinct_cities).to include("Denver")
      expect(@meg.distinct_cities).to include("Hershey")
    end

    it "Returns the pending orders for a specified merchant" do
    chain = @meg.items.create(name: "Chain", description: "It'll never break!", price: 40, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 22)
    regular_user = User.create!(name: "Harry Richard", address: "1234 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "regular_user@email.com", password: "123", role: 0)
    expect(@meg.pending_orders).to eq([])
    order_1 = regular_user.orders.create!(name: 'Meg', address: '123 Stang Ave', city: 'Hershey', state: 'PA', zip: 17033)
    order_1.item_orders.create!(status: "pending", item: @tire, price: @tire.price, quantity: 2)
    expect(@meg.pending_orders.first).to eq(order_1)
    end

    it "can give disabled status" do
      expect(@meg.disabled?).to eq(false)
    end

    it "can disable and enable merchant's items" do
      expect(@meg.items.find(@tire.id).active?).to eq(true)
      @meg.deactivate_items
      expect(@meg.items.find(@tire.id).active?).to eq(false)
      @meg.activate_items
      expect(@meg.items.find(@tire.id).active?).to eq(true)
    end

    it "can create bulk discount" do
      @m1 = Merchant.create!(name: "Harry Potter Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))
      @wand = @m1.items.create!(name: 'Wand', description: "Wand replica", price: 22, image: "https://images-na.ssl-images-amazon.com/images/I/61cWISkxk4L._AC_SL1500_.jpg", active?: true, inventory: 31 )
      @cloak = @m1.items.create!(name: 'Cloak', description: "Harry Potter cloak", price: 35, image: "https://images.beautifulhalo.com/images/392x588/201904/K/harry-potter-gryffindor-cosplay-costume-magic-robe-cloak-halloween-costumes-cape_1554311096436.jpg", active?: true, inventory: 11 )
      @tattoo = @m1.items.create!(name: 'Scar Tattoo', description: "Temporary Harry Potter tattoos", price: 3, image: "https://d2h1pu99sxkfvn.cloudfront.net/b0/5083776/339841950_B7PJv3ShYz/P0.jpg", active?: true, inventory: 250 )
      @bluray = @m1.items.create!(name: 'Blu Ray Box Set', description: "All of the movies", price: 35, image: "https://images-na.ssl-images-amazon.com/images/I/81weyEaCDsL._SL1500_.jpg", active?: true, inventory: 250 )
      @books = @m1.items.create!(name: 'Book Box Set', description: "All of the books", price: 33, image: "https://images-na.ssl-images-amazon.com/images/I/71rOzy4cyAL.jpg", active?: true, inventory: 19 )
      @broom = @m1.items.create!(name: 'Broom', description: "Broom replica", price: 19, image: "https://images-na.ssl-images-amazon.com/images/I/41K1kDMDHcL._AC_SX466_.jpg", active?: true, inventory: 13 )
      @snitch = @m1.items.create!(name: 'Snitch', description: "Snitch replica from quidditch", price: 65, image: "https://m2.mbl.is/PRVkEAWgTalstg5bEQ4KNMt1ucM=/758x505/smart/frimg/1/9/32/1093256.jpg", active?: true, inventory: 3 )
      data = Hash.new
      data[:name] = "5/5"
      data[:quantity] = "5"
      data[:percentage] = "5"
      @m1.create_bulk_discount(data)
      expect(Discount.all.count).to eq(7)
    end
  end
end
