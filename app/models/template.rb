class Template < ActiveRecord::Base

  attr_accessible :name, :type, :item_id, :quantity
  
  
  belongs_to :item
  
  
end
