FactoryBot.define do
  factory :tea do
    name { [Faker::Fantasy::Tolkien.character, Faker::Books::CultureSeries.culture_ship, Faker::GreekPhilosophers.name, Faker::Space.galaxy].sample }
    tea_type { ["Green", "Black", "Herbal", "Oolong"].sample }
    description { [Faker::Fantasy::Tolkien.poem, Faker::Quotes::Shakespeare.as_you_like_it_quote].sample }
    frequency { Faker::Subscription.subscription_term } 
    temperature { rand(160..212) }
    brew_time { rand(2..7) }
    caffeine_free { [true, false].sample }
    origin_country { Faker::Nation.nationality }
    tasting_note { ["moss", "smoke", "floral", "cedar"].sample }
    origin_country { Faker::Nation.nationality }
    tasting_note { ["moss", "smoke", "fruity", "cedar", "earthy", "floral"].sample }
    price { Faker::Commerce.price(range: 14..100.0).to_d }
    stock_quantity { rand(0..200) }
  end
end
 
