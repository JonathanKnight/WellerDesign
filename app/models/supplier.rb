class Supplier < ActiveRecord::Base

  attr_accessible :name, :email, :address
  has_many :items
  accepts_nested_attributes_for :items  
  has_many :purchaseorders
  accepts_nested_attributes_for :purchaseorders
  
  def outstanding_purchases
    purchases = Purchase.joins(:element => :item).where(:items => {:supplier_id => self.id}).where(:purchaseorder => {:id => nil})
  end
  
end
