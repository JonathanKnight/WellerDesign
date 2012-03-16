class Job < ActiveRecord::Base

  attr_accessible :name, :address, :client_id, :markup
  
  
  belongs_to :client
  
  has_many :rooms
  accepts_nested_attributes_for :rooms
  
  has_many :invoices
  accepts_nested_attributes_for :invoices
  
  
end
