# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
# seed 50 records
50.times do
    video = Video.create(title: Faker::Lorem.word, filepath: Faker::Lorem.word, description: Faker::Lorem.word, address_1: Faker::Lorem.word, address_2: Faker::Lorem.word, city: Faker::Lorem.word, state: Faker::Lorem.word, zip_code: Faker::Lorem.word, created_by: User.first.id)
    
  end
