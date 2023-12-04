class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_available, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
