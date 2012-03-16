class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
        t.string :name
        t.string :email
  
      t.timestamps
    end
      add_index :clients,:id, :unique => true
  
  
  
    
  end

  def self.down
    drop_table :clients
  end
end
