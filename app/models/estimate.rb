class Estimate < ActiveRecord::Base

  attr_accessible :name, :room_id, :sale_id
  
  belongs_to :room
  
  has_many :elements
  accepts_nested_attributes_for :elements
  
  belongs_to :sale
  validates_presence_of :quantity, :room_id
  
  def self.make_estimate(type)
      @templates = Template.where(:name => 'Estimate',:type => type)
      @templates.each do |t|
        e = Element.create!(:estimate_id => self.id, :item_id => t.item_id, :quantity => t.quantity, :due_at => Time.now >> 1)
        e.save
      end
    end
  end

  
end
