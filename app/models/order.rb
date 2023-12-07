class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :user, :order_date, :total_amount, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validate :order_date_in_past, if: -> { order_date.present? }
  # validate :custom_order_validation, if: -> { some_condition_is_met? }

  # Custom Validations
  def order_date_in_past
    errors.add(:order_date, 'should be in the past') if order_date > Date.current
  end
end
