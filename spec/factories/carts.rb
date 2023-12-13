# spec/factories/carts.rb

FactoryBot.define do
    factory :cart do
      association :user
      # any additional attributes or logic you want for cart creation
  
      trait :with_items do
        # use this trait if you want to create a cart with associated cart items
        after(:create) do |cart|
          create_list(:cart_item, 3, cart: cart)
        end
      end
    end
  end
  