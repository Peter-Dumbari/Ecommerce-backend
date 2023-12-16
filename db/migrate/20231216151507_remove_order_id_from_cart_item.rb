class RemoveOrderIdFromCartItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :order_id, :integer
  end
end
