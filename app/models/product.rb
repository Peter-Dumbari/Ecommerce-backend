class Product < ApplicationRecord
has_many :product_categories

validates :name, :description, :price, :quantity_available, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
  validates :name, uniqueness: true
end
