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
  
  def fullvalue
    v = [[0,0],[0,0],[0,0]]
    self.rooms.each do |room|
      fvalue = room.fullvalue
      v[0][0] += fvalue[0][0]
      v[0][1] += fvalue[0][1]
      v[1][0] += fvalue[1][0]
      v[1][1] += fvalue[1][1]
      v[2][0] += fvalue[2][0]
      v[2][1] += fvalue[2][1]
    end
    v
  end
  
end
