class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
        t.string :name
        t.string :type
        t.references :item
        t.decimal :quantity, :precision => 8, :scale => 2     
      t.timestamps
    end
      add_index :templates,:id, :unique => true
  
  

      add_index :templates,:item_id
  
  
    
  end

  def self.down
    drop_table :templates
  end
end
