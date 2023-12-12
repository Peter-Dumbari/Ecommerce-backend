class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  validates :user, presence: true
  validate :validate_cart_items_quantity

  private

  def validate_cart_items_quantity
    return unless cart_items

    return unless cart_items.sum(:quantity) <= 0

    errors.add(:base, 'Cart should have at least one item with a positive quantity')
  end
end
