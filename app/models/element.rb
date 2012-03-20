class Element < ActiveRecord::Base

  attr_accessible :estimate_id, :item_id, :quantity, :due_at, :completed_at, :deleted_at
  belongs_to :estimate
  belongs_to :item
  has_one :purchase
  validates_presence_of :quantity, :estimate_id,:item_id
  
  def value
    [self.quantity*self.item.price_ex_vat, self.quantity*self.item.price_inc_vat]
  end

  def self.open_tasks
    Element.where(:purchase_id => nil).joins(:item => :supplier).where(:suppliers => {:id =>1})
  end
  
  def set_purchase_fields(purchase)
    if self.item.supplier_id == 1
      purchase.quantity = Timesheet.close_timesheet(self.id)
      purchase.duedate = Date.today
      purchase.completed = Date.today
    else
      purchase.quantity = self.quantity
      purchase.duedate = Date.today >> 1  
      purchase.completed = nil
    end
    purchase.price_ex_vat = self.item.price_ex_vat
    purchase.price_inc_vat = self.item.price_inc_vat
  end
  

  
  
end
