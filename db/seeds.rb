# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Discount.destroy_all
ItemOrder.destroy_all
Order.destroy_all
User.destroy_all
Merchant.destroy_all
Item.destroy_all


m1 = Merchant.create!(name: "Harry Potter Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))
m2 = Merchant.create!(name: "Soccer Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))
m3 = Merchant.create!(name: "Breaking Bad Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))
m4 = Merchant.create!(name: "Music Store", address: "#{Faker::Address.street_address} #{Faker::Address.street_suffix}", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: rand(10000...99999))

m1.items.create!(name: 'Wand', description: "Wand replica", price: 22, image: "https://images-na.ssl-images-amazon.com/images/I/61cWISkxk4L._AC_SL1500_.jpg", active?: true, inventory: 31 )
m1.items.create!(name: 'Cloak', description: "Harry Potter cloak", price: 35, image: "https://images.beautifulhalo.com/images/392x588/201904/K/harry-potter-gryffindor-cosplay-costume-magic-robe-cloak-halloween-costumes-cape_1554311096436.jpg", active?: true, inventory: 11 )
m1.items.create!(name: 'Scar Tattoo', description: "Temporary Harry Potter tattoos", price: 3, image: "https://d2h1pu99sxkfvn.cloudfront.net/b0/5083776/339841950_B7PJv3ShYz/P0.jpg", active?: true, inventory: 250 )
m1.items.create!(name: 'Blu Ray Box Set', description: "All of the movies", price: 35, image: "https://images-na.ssl-images-amazon.com/images/I/81weyEaCDsL._SL1500_.jpg", active?: true, inventory: 250 )
m1.items.create!(name: 'Book Box Set', description: "All of the books", price: 33, image: "https://images-na.ssl-images-amazon.com/images/I/71rOzy4cyAL.jpg", active?: true, inventory: 19 )
m1.items.create!(name: 'Broom', description: "Broom replica", price: 19, image: "https://images-na.ssl-images-amazon.com/images/I/41K1kDMDHcL._AC_SX466_.jpg", active?: true, inventory: 13 )
m1.items.create!(name: 'Snitch', description: "Snitch replica from quidditch", price: 65, image: "https://m2.mbl.is/PRVkEAWgTalstg5bEQ4KNMt1ucM=/758x505/smart/frimg/1/9/32/1093256.jpg", active?: true, inventory: 3 )

m2.items.create!(name: 'Cristiano Ronaldo Kit', description: "Renaldo kit", price: 50, image: "https://cdn.vox-cdn.com/thumbor/6mxT1xR759RTwxGbj-kWV-sh3HQ=/1400x0/filters:no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/11674521/Screen_Shot_2018_07_11_at_10.09.57_AM.png", active?: true, inventory: 14 )
m2.items.create!(name: 'Lionel Messi Kit', description: "Messi kit", price: 50, image: "https://images-na.ssl-images-amazon.com/images/I/619%2BKSbV1pL._AC_UX522_.jpg", active?: true, inventory: 9 )
m2.items.create!(name: 'Pierre Emerick Aubameyang Kit', description: "Aubameyang kit", price: 50, image: "https://static3.tcdn.com.br/img/img_prod/398440/camisa_adidas_arsenal_home_2020_14_aubameyang_65802_1_20190731082238.jpg", active?: true, inventory: 8 )
m2.items.create!(name: 'Alexandre Lacazette Kit', description: "Lacazette kit", price: 50, image: "https://www.soccerpro.com/wp-content/uploads/2018/02/751521_02lac_puma_alexandre_lacazette_arsenal_home_jsy_y_01.jpg", active?: true, inventory: 4 )
m2.items.create!(name: 'Mesut Ozil Kit', description: "Ozil kit", price: 50, image: "https://www.soccerpro.com/wp-content/uploads/fh7815ozi_2020_21_adidas_mesut_ozil_arsenal_home_authentic_jsy_01-500x500.jpg", active?: true, inventory: 7 )
m2.items.create!(name: 'Hector Bellerin Kit', description: "Bellerin kit", price: 50, image: "https://www.soccerpro.com/wp-content/uploads/eh5637bel_2019_20_adidas_hector_bellerin_arsenal_home_jsy_01.jpg", active?: true, inventory: 22 )
m2.items.create!(name: 'Kieran Tierney Kit', description: "Tierney kit", price: 50, image: "https://images.sportsdirect.com/images/products/37717408_l.jpg", active?: true, inventory: 11 )
m2.items.create!(name: 'Granit Xhaka kit Kit', description: "Xhaka kit", price: 50, image: "https://www.footballshirt.store/football-gears/arsenal/men's-19-20-arsenal-34-granit-xhaka-home-red-official-jersey.jpg", active?: true, inventory: 12 )
m2.items.create!(name: 'Bernd Leno Kit', description: "Leno kit", price: 50, image: "https://www.thesun.co.uk/wp-content/uploads/2019/07/Leno.jpg", active?: true, inventory: 2 )
m2.items.create!(name: 'Dani Ceballos Kit', description: "Ceballos kit", price: 50, image: "https://www.footballshirt.store/football-gears/arsenal/2020-21-men's-arsenal-8-dani-ceballos-red-home-official-jersey.jpg", active?: true, inventory: 9 )
m2.items.create!(name: 'Ainsley Maitland-Niles Kit', description: "Maitland-Niles kit", price: 50, image: "https://www.footballshirt.store/football-gears/arsenal/2020-21-men's-arsenal-15-ainsley-maitland-niles-red-home-official-jersey.jpg", active?: true, inventory: 8 )
m2.items.create!(name: 'Rob Holding Kit', description: "Holding kit", price: 50, image: "https://x1.adis.ws/v1/media/graphics/i/ArsenalDirect/MFH7814_pl?name=HOLDING&numbers=pl-home__2020-21--16", active?: true, inventory: 8 )
m2.items.create!(name: 'Nicolas Pepe Kit', description: "Pepe kit", price: 50, image: "https://images.sportsdirect.com/images/products/37809108_l.jpg", active?: true, inventory: 15 )
m2.items.create!(name: 'Matteo Guendouzi Kit', description: "Guendouzi kit", price: 50, image: "https://www.soccerpro.com/wp-content/uploads/eh5644gue_2019_20_y_adidas_matteo_guendouzi_arsenal_home_jsy_01.jpg", active?: true, inventory: 18 )
m2.items.create!(name: 'Joe Willock Kit', description: "Willock kit", price: 50, image: "https://www.footballshirt.store/football-gears/arsenal/2020-21-men's-arsenal-28-joe-willock-red-home-official-jersey.jpg", active?: true, inventory: 19 )
m2.items.create!(name: 'Eddie Nketiah Kit', description: "Aubameyang kit", price: 50, image: "https://www.footballfangear.site/images/arsenal/forward-home-men's-jersey-1a.jpg", active?: true, inventory: 4 )
m2.items.create!(name: 'Emile Smith-Rowe Kit', description: "Smith-Rowe kit", price: 50, image: "https://www.footballfangear.site/images/arsenal/emile-smith-rowe-19-20-home-men's-jersey.jpg", active?: true, inventory: 6 )
m2.items.create!(name: 'William Saliba Kit', description: "Saliba kit", price: 50, image: "https://2.bp.blogspot.com/-rhdLHoHz0Zk/XxwScBEWXFI/AAAAAAAAT1k/_MfFXA0jt1wUHWXwnMArgUyLGM2ZWF_iACLcBGAsYHQ/s550/new-arsenal-fc-20-21-squad-numbers-2.jpg", active?: true, inventory: 7 )

m3.items.create!(name: 'BB Mugs', description: "Breaking Bad drinking mugs", price: 20, image: "https://cdn.shopify.com/s/files/1/1565/9935/products/bbdjfmug01_81c4a41e-add4-4312-abe0-36df7a091e07_large.jpg?v=1567148192", active?: true, inventory: 8 )
m3.items.create!(name: 'Heisenberg Shirt', description: "Shirt featuring the character Heisenberg", price: 14, image: "https://cdn.shopify.com/s/files/1/1565/9935/products/bbdtvtat104_9e7cd0b0-40eb-4131-877c-620ea8207be0_1200x1200.jpg?v=1567148265", active?: true, inventory: 8 )
m3.items.create!(name: 'Jesse Coozie', description: "Science!", price: 4, image: "https://static.redditgifts.com/images/uploaded/large-present/2013/12/30/breaking-bad-merch-1388410951.jpg", active?: true, inventory: 8 )

m4.items.create!(name: 'Prince Purple Rain Vinyl Album', description: "Purple Rain by Prince", price: 22, image: "https://target.scene7.com/is/image/Target/GUEST_0e0722ab-4c9a-46f3-96bb-2086468497bd?wid=488&hei=488&fmt=pjpeg", active?: true, inventory: 5 )
m4.items.create!(name: "Elvis 45 (Blue Moon of Kentucky)", description: "Original 45 by one of the greats", price: 18, image: "https://www.popsike.com/pix/20050117/4068474731.jpg", active?: true, inventory: 2 )
m4.items.create!(name: 'Muddy Waters Live at Newport', description: "Muddy's famous live performance from 1960", price: 26, image: "https://images-na.ssl-images-amazon.com/images/I/81ZPjQ77IML._SL1500_.jpg", active?: true, inventory: 4 )

admin_user = User.create!(name: "Admin Man", address: "1234 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "admin_user@email.com", password: "123", role: 2)
regular_user = User.create!(name: "Scott Stapp", address: "1234 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "regular_user@email.com", password: "123", role: 0)
second_user = User.create!(name: "Drew Bob", address: "1 Bland St.", city: "Denver", state: "CO", zip: "80085", email: "second_user@email.com", password: "123", role: 0)
third_user = User.create!(name: "Scooby Doo", address: "133 Main St.", city: "Denver", state: "CO", zip: "80085", email: "third_user@email.com", password: "123", role: 0)
fourth_user = User.create!(name: "Jerry McGuire", address: "14 Harry St.", city: "Denver", state: "CO", zip: "80085", email: "fourth_user@email.com", password: "123", role: 0)
m1_user = User.create!(name: "James Potter", address: "123 Diagon Alley", city: "Denver", state: "CO", zip: "80085", email: "m1_user@email.com", password: "123", role: 1, merchant_id: m1.id)
m2_user = User.create!(name: "Arsene Wenger", address: "456 Gunner Ave.", city: "Denver", state: "CO", zip: "80085", email: "m2_user@email.com", password: "123", role: 1, merchant_id: m2.id)
m3_user = User.create!(name: "Walter White", address: "723 Hank St.", city: "Denver", state: "CO", zip: "80085", email: "m3_user@email.com", password: "123", role: 1, merchant_id: m3.id)
m4_user = User.create!(name: "Roger Nelson", address: "20499 Raspberry Blvd.", city: "Denver", state: "CO", zip: "80085", email: "m4_user@email.com", password: "123", role: 1, merchant_id: m4.id)
