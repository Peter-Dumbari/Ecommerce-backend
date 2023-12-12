class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :carts

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user, presence: true
  validates :product, presence: true

  validate :validate_quantity_available

  private

  def validate_quantity_available
    return unless product && quantity

    return unless quantity > product.quantity_available

    errors.add(:quantity, "is greater than available stock for #{product.name}")
  end
end