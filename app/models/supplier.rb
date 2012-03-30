class Supplier < ActiveRecord::Base

  attr_accessible :name, :email, :address
  has_many :items
  accepts_nested_attributes_for :items  
  has_many :purchaseorders
  accepts_nested_attributes_for :purchaseorders
  
  def outstanding_purchases
    firstelement = Element.joins(:purchase).where(:purchases => {:purchaseorder_id => nil}).joins(:item).where(:items => {:supplier_id => self.id}).first
    if firstelement
      purchases = Purchase.where(:purchaseorder_id => nil).joins(:element => :item).where(:items => {:supplier_id => self.id}).
          where(:elements => {:delivery_address => firstelement.delivery_address}).readonly(false)
    else
    []
    end
  end
  
  def purchases
    purchases = Purchase.joins(:element => :item).where(:items => {:supplier_id => self.id})   
  end
  
end
