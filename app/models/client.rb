class Client < ActiveRecord::Base

  attr_accessible :name, :email
  
  
  has_many :jobs
  accepts_nested_attributes_for :jobs
  
end
