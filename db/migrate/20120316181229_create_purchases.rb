class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
        t.references :element
        t.datetime :duedate
        t.decimal :quantity, :precision => 8, :scale => 2     
        t.decimal :price_ex_vat, :precision => 8, :scale => 2     
        t.decimal :price_inc_vat, :precision => 8, :scale => 2     
        t.datetime :completed_at
        t.references :purchase_order
      t.timestamps
    end
      add_index :purchases,:id, :unique => true

      add_index :purchases,:element_id
  
  
  
  
  
  

      add_index :purchases,:purchase_order_id
  
    
  end

  def self.down
    drop_table :purchases
  end
end
