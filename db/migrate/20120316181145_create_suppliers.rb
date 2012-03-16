class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
        t.string :name
        t.string :email
        t.text :address
  
  
      t.timestamps
    end
      add_index :suppliers,:id, :unique => true
  
  
  
  
  
    
  end

  def self.down
    drop_table :suppliers
  end
end
