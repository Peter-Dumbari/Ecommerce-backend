require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).only_integer.is_greater_than(0) }
  it { should validate_presence_of(:product) }

  it 'should validate quantity availability' do
    cart_item = FactoryBot.build(:cart_item)
    cart_item.product.quantity_available = 10
    cart_item.quantity = 15

    expect(cart_item).not_to be_valid
    expect(cart_item.errors[:quantity]).to include("is greater than available stock for #{cart_item.product.name}")

    cart_item.quantity = 5

    expect(cart_item).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
  end
end
