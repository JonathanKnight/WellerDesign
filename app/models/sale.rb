class Sale < ActiveRecord::Base

  attr_accessible :quantity, :price_ex_vat, :price_inc_vat, :invoice_id
  has_one :estimate  
  belongs_to :invoice
  validates_presence_of :quantity, :price_ex_vat, :price_inc_vat
  def self.no_invoice
     @uninvoices = Sale.joins(:element => {:room => {:job => :client}}).joins(:element => :estimate).where(:estimates => {:deleted_at => nil}).where(:sales => {:invoice_id => nil}).group(:jobs => :id).select("clients.name as clientname,jobs.name as jobname,jobs.id as job_id,count(*) as count_sales,sum(sales.quantity*sales.price_inc_vat) as value_sales")
  end
  
  def value
    [self.quantity*self.price_ex_vat,self.quantity*self.price_inc_vat]
  end
  
end
