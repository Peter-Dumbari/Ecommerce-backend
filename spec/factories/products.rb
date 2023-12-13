
FactoryBot.define do
    factory :product do
      name { 'Phone' }  # Ensure a valid name is provided
      description { 'it is used in making calls' }
      price { '23' }
      quantity_available { 2 }
      photos_attributes { [{:image_url=>"http://test.test/photo1.jpg"}] }
    end
end