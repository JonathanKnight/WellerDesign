class Job < ActiveRecord::Base

  attr_accessible :name, :address, :client_id, :markup
  
  
  belongs_to :client
  
  has_many :rooms
  accepts_nested_attributes_for :rooms
  
  has_many :invoices
  accepts_nested_attributes_for :invoices
  
  def value
    v = [0,0]
    self.rooms.each do |room|
      evalue = room.value
      v[0] += evalue[0]
      v[1] += evalue[1]
    end
    v
  end
  
  
end
