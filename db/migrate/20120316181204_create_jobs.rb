class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
        t.string :name
        t.text :address
        t.references :client
  
  
        t.decimal :markup, :precision => 8, :scale => 2     
      t.timestamps
    end
      add_index :jobs,:id, :unique => true
  
  

      add_index :jobs,:client_id
  
  
  
  
    
  end

  def self.down
    drop_table :jobs
  end
end
