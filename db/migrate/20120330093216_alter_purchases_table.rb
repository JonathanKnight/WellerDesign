class AlterPurchasesTable < ActiveRecord::Migration
  def up
    rename_column :purchases,:purchase_order_id, :purchaseorder_id
  end

  def down
    rename_column :purchases,:purchaseorder_id, :purchase_order_id
  end
end
