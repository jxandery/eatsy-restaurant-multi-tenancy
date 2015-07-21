class ChangeColumnDefaultOrderStatusToOrderedForOrders < ActiveRecord::Migration
  def change
    change_column_default :orders, :order_status, "ordered"
  end
end
