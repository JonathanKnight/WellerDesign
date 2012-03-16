class Item < ActiveRecord::Base

  attr_accessible :name, :code, :supplier_id, :category_id, :price_ex_vat, :price_inc_vat, :quantity, :units
  
  
  belongs_to :supplier
  
  belongs_to :category
  validates_presence_of :name,:code,:supplier_id, :price_inc_vat, :price_ex_vat

  
  
  
  
  
end
