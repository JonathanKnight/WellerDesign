class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
        t.string :name
        t.string :code
        t.references :supplier
        t.references :category
        t.decimal :price_ex_vat, :precision => 8, :scale => 2     
        t.decimal :price_inc_vat, :precision => 8, :scale => 2     
        t.decimal :quantity, :precision => 8, :scale => 2     
        t.string :units
      t.timestamps
    end
      add_index :items,:id, :unique => true
  
  

      add_index :items,:supplier_id
  

      add_index :items,:category_id
  
  
  
  
  
    
  end

  def self.down
    drop_table :items
  end
end
