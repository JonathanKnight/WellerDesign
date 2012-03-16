class CreateTimesheets < ActiveRecord::Migration
  def self.up
    create_table :timesheets do |t|
        t.references :user
        t.references :element
        t.string :description
        t.datetime :opened_at
        t.datetime :closed_at
        t.boolean :chargeable
      t.timestamps
    end
      add_index :timesheets,:id, :unique => true

      add_index :timesheets,:user_id
  

      add_index :timesheets,:element_id
  
  
  
  
  
    
  end

  def self.down
    drop_table :timesheets
  end
end
