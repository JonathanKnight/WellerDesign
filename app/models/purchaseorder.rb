class Purchaseorder < ActiveRecord::Base

  attr_accessible :supplier_id, :sent_at, :instructions
  has_many :purchases
  accepts_nested_attributes_for :purchases
  
  belongs_to :supplier
  def self.create_from_purchases(supplier_id)
    @purchase_order = PurchaseOrder.create!(:supplier_id => supplier_id)
    @purchases = Purchase.where(:purchaseorder_id => nil).joins(:element => :item).where(:items => {:supplier_id => supplier_id}).where(:elements => {deleted_at => nil}).readonly(false)
    @purchases.each { |p| p.update_attributes(:purchaseorder_id => @purchase_order.id) }
  end
  
  def value
    s = Purchase.where(:purchases => {:purchaseorder_id => self.id}).select("sum(quantity * price_inc_vat) as sqltotal").first.sqltotal
  end

  
  
  
end
