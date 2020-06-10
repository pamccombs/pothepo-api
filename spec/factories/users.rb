FactoryBot.define do
    factory :user do
      username { Faker::Name.name }
      email 'foo@bar.com'
      password 'foobar'
      first_name { Faker::Name.name }
      last_name { Faker::Name.name }
    end
  end