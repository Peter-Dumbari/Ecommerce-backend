class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_many :photos  # Use has_many for multiple photos
  
    validates :name, :description, :price, :quantity_available, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity_available, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :name, length: { maximum: 255 }
    validates :description, length: { maximum: 1000 }
    validates :name, uniqueness: true
  
    accepts_nested_attributes_for :photos
  
    validates_associated :photos
    validate :at_least_one_photo
  
    private
  
    def at_least_one_photo
      errors.add(:image, 'At least one photo is required') if photos.empty?
    end
  end
  