class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
  
        t.decimal :quantity, :precision => 8, :scale => 2     
        t.decimal :price_ex_vat, :precision => 8, :scale => 2     
        t.decimal :price_inc_vat, :precision => 8, :scale => 2     
        t.references :invoice
      t.timestamps
    end
      add_index :sales,:id, :unique => true
  
  
  
  

      add_index :sales,:invoice_id
  
    
  end

  def self.down
    drop_table :sales
  end
end
