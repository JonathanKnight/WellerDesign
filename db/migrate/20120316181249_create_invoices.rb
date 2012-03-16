class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
        t.references :job
  
        t.datetime :sent_at
      t.timestamps
    end
      add_index :invoices,:id, :unique => true

      add_index :invoices,:job_id
  
  
  
    
  end

  def self.down
    drop_table :invoices
  end
end
