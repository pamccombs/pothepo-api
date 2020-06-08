FactoryBot.define do
    factory :video do
      title { Faker::Movies::StarWars.character }
      filepath { Faker::Movies::StarWars.character }
      user_id nil
      description { Faker::Name.name }
      address_1 { Faker::Name.name }
      address_2 { Faker::Name.name }
      city { Faker::Name.name }
      state { Faker::Name.name }
      zip_code { Faker::Name.name }

    end
  end