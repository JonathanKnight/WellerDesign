class Purchase < ActiveRecord::Base

  attr_accessible :element_id, :duedate, :quantity, :price_ex_vat, :price_inc_vat, :completed_at, :purchaseorder_id
  belongs_to :element
  belongs_to :purchaseorder
  def supplier
    @supplier = Supplier.joins(:items => {:elements => :purchase}).where(:purchases => {:purchase_id => id})
  end
  
  def self.suppliers_where_no_purchase_order
    @suppliers = Supplier.joins(:items => {:elements => :purchase}).where(:purchases => {:purchase_order_id => nil}).where(:elements => {:deleted_at => nil}).where("items.supplier_id != ?",1).select("distinct suppliers.*")
  end

  def set_sale_fields(sale)
    sale.quantity = self.quantity
    markup = self.element.room.job.markup
    sale.price_ex_vat = self.price_ex_vat * markup
    sale.price_inc_vat = self.price_inc_vat * markup
  end

  
end
