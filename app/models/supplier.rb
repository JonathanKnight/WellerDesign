class Supplier < ActiveRecord::Base

  attr_accessible :name, :email, :address
  
  
  
  has_many :items
  accepts_nested_attributes_for :items
  
  has_many :purchase_orders
  accepts_nested_attributes_for :purchase_orders
  
end
