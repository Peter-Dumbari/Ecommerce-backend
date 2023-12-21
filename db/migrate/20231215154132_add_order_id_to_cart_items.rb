class AddOrderIdToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :order_id, :integer
  end
end
