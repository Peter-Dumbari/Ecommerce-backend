class ChangeDefaultStatusToNullInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :status, from: "pending", to: nil
  end
end
