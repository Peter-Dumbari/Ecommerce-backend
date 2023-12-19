class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :subtotal, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :calculate_subtotal

  private

  def calculate_subtotal
    self.subtotal = quantity * product.price if quantity && product
  end
end
