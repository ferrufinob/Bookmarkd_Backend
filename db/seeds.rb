# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Brenda", email: "brenda@email.com", password: "password")

Board.create(name: "Cats", user_id: 1)

Pin.create(title: "Tabby Cat", description: "Tabby Cat Facts", image: "https://www.aspcapetinsurance.com/media/2207/tabby-cat-facts.jpg", site_url: "https://www.aspcapetinsurance.com/resources/tabby-cat-facts/", user_id: 1, board_id: 1)
