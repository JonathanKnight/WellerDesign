class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
        t.references :estimate
        t.references :item
        t.decimal :quantity, :precision => 8, :scale => 2     
        t.datetime :due_at
        t.datetime :completed_at
  
        t.datetime :deleted_at
      t.timestamps
    end
      add_index :elements,:id, :unique => true

      add_index :elements,:estimate_id
  

      add_index :elements,:item_id
  
  
  
  
  
  
    
  end

  def self.down
    drop_table :elements
  end
end
