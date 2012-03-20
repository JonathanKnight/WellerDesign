class Invoice < ActiveRecord::Base

  attr_accessible :job_id, :sent_at
  belongs_to :job
  
  has_many :sales
  def self.create_from_salesgroup(job_id)
    @job = Job.find(job_id)
    if @job
      @invoice = Invoice.create!(:job_id => job_id,:client_id => @job.client.id,:sent_at => nil)
      @salegroup = Salegroup.where(:invoice_id => nil).joins(:sales => {:element => {:room => :job}}).where(:jobs => {:id => job_id}).readonly(false)
      @salegroup.each { |s| s.update_attributes(:invoice_id => @invoice.id) }
      @invoice
    end
  end   

  accepts_nested_attributes_for :sales
  
  
end
