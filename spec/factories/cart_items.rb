# spec/factories/cart_items.rb
FactoryBot.define do
    factory :cart_item do
      association :user
      association :product
      quantity { 1 }
      association :cart
    end
  end
  