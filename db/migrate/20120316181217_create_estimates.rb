class CreateEstimates < ActiveRecord::Migration
  def self.up
    create_table :estimates do |t|
        t.string :name
        t.references :room
  
        t.references :sale
      t.timestamps
    end
      add_index :estimates,:id, :unique => true
  

      add_index :estimates,:room_id
  
  

      add_index :estimates,:sale_id
  
    
  end

  def self.down
    drop_table :estimates
  end
end
