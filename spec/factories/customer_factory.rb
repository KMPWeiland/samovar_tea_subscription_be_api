FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    email { Faker::Internet.unique.email } 
    address { Faker::Address.unique.full_address }  
  end
end
