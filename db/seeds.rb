# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Customers
  10.times do
    Customer.create!(
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.unique.last_name,
      email: Faker::Internet.unique.email,
      address: Faker::Address.unique.full_address
    )
  end

# Teas
  2.times do
    Tea.create!(
      name: Faker::Fantasy::Tolkien.unique.character,
      tea_type: 'Green',
      description: Faker::Fantasy::Tolkien.poem,
      temperature: 178,
      brew_time: 3,
      caffeine_free: [true, false].sample || false,
      origin_country: Faker::Nation.nationality,
      tasting_note: 'moss',
      price: Faker::Commerce.price(range: 14..100.0).to_d,
      stock_quantity: Faker::Number.between(from: 0, to: 200)
    )
  end

  2.times do
    Tea.create!(
      name: Faker::Books::CultureSeries.unique.culture_ship,
      tea_type: 'Black',
      description: Faker::Fantasy::Tolkien.poem,
      temperature: 212,
      brew_time: 4,
      caffeine_free: [true, false].sample || false,
      origin_country: Faker::Nation.nationality,
      tasting_note: 'smoke',
      price: Faker::Commerce.price(range: 14..100.0).to_d,
      stock_quantity: Faker::Number.between(from: 0, to: 200)
    )
  end

  2.times do
    Tea.create!(
      name: Faker::GreekPhilosophers.unique.name,
      tea_type: 'Herbal',
      description: Faker::Quotes::Shakespeare.unique.as_you_like_it_quote, 
      temperature: 212,
      brew_time: 7,
      caffeine_free: [true, false].sample || false,
      origin_country: Faker::Nation.nationality,
      tasting_note: 'floral',
      price: Faker::Commerce.price(range: 14..100.0).to_d,
      stock_quantity: Faker::Number.between(from: 0, to: 200)
    )
  end

  2.times do
    Tea.create!(
      name: Faker::Space.unique.galaxy,
      tea_type: 'Oolong',
      description: Faker::Quotes::Shakespeare.unique.as_you_like_it_quote,
      temperature: 195,
      brew_time: 5,
      caffeine_free: [true, false].sample || false,
      origin_country: Faker::Nation.nationality,
      tasting_note: 'cedar',
      price: Faker::Commerce.price(range: 14..40.0).to_d,
      stock_quantity: Faker::Number.between(from: 0, to: 200)
    )
  end

# Subscriptions
  10.times do
    Subscription.create!(
      title: Faker::Subscription.plan,
      price: Faker::Commerce.price(range: 14..100.0).to_d,
      status: ['Active', 'Cancelled', 'Non-Payment'].sample.to_s,
      frequency: Faker::Subscription.subscription_term
    )
  end 

# SubscriptionTeas
  subscriptions = Subscription.all
  teas = Tea.all

  subscriptions.each do |subscription|
    teas.sample(rand(1..3)).each do |tea|
      SubscriptionTea.create(
        subscription: subscription,
        tea: tea, 
        quantity: rand(1..2)
      )
    end
  end

