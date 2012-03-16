class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
        t.string :name
        t.references :job
  
        t.decimal :width, :precision => 8, :scale => 2     
        t.decimal :length, :precision => 8, :scale => 2     
        t.decimal :height, :precision => 8, :scale => 2     
        t.integer :windows
      t.timestamps
    end
      add_index :rooms,:id, :unique => true
  

      add_index :rooms,:job_id
  
  
  
  
  
  
    
  end

  def self.down
    drop_table :rooms
  end
end
