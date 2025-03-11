FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Commerce.price(range: 14..100.0).to_d }
    frequency { rand(1..20) } 
    status { ["Active", "Cancelled", "Non-Payment"].sample } 

    trait :active do
      status { 'Active' }
    end

    trait :cancelled do
      status { 'Cancelled' }
    end

    trait :non_payment do
      status { 'Non-Payment' }
    end
  end
end
