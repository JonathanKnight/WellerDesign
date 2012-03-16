class CreatePurchaseorders < ActiveRecord::Migration
  def self.up
    create_table :purchaseorders do |t|
  
        t.references :supplier
        t.datetime :sent_at
        t.text :instructions
      t.timestamps
    end
      add_index :purchaseorders,:id, :unique => true
  

      add_index :purchaseorders,:supplier_id
  
  
  
    
  end

  def self.down
    drop_table :purchaseorders
  end
end
