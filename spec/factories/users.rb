FactoryBot.define do
  factory :user do
    name { 'John Doe' } # Ensure a valid name is provided
    email { 'john@example.com' }
    password { 'password' }
  end
end
