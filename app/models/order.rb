class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart, optional: true  # Add this line to make the cart association optional
  has_many :order_items
  
  validates :user, :order_date, :total_amount, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validate :order_date_in_past, if: -> { order_date.present? }
  validates :status, inclusion: { in: %w[pending processing completed], message: "Invalid status" }
  validates :payment_method, inclusion: { in: %w[credit_card paypal], message: "Invalid payment method" }

  private

  def order_date_in_past
    errors.add(:order_date, 'should be in the past') if order_date > Date.current
  end
end
