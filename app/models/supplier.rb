class Supplier < ActiveRecord::Base

  attr_accessible :name, :email, :address
  has_many :items
  accepts_nested_attributes_for :items  
  has_many :purchaseorders
  accepts_nested_attributes_for :purchaseorders
  
  def outstanding_purchases
    purchases = Purchase.where(:purchase_order_id => nil).joins(:element => :item).where(:items => {:supplier_id => self.id}).readonly(false)
  end
  
end
