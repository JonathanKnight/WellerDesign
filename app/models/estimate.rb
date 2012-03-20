class Estimate < ActiveRecord::Base

  attr_accessible :name, :room_id, :sale_id, :elements_attributes
  belongs_to :room
  has_many :elements
  accepts_nested_attributes_for :elements
  belongs_to :sale
  validates_presence_of :name,:room_id
  
  def quantity
    if self.elements.count == 1
      self.elements.first.quantity
    else
      1
    end
  end
  
  def price_ex_vat
    if self.elements.count == 1
      self.elements.first.price_ex_vat
    else
      self.value[0]
    end
  end
  
  def price_inc_vat
    if self.elements.count == 1
      self.elements.first.price_inc_vat
    else
      self.value[1]
    end
  end
  
  def value
    v = [0,0]
    self.elements.each do |element|
      evalue = element.value
      v[0] += evalue[0]
      v[1] += evalue[1]
    end
    v
  end
  
  def started
    self.elements.each do |element|
      if element.purchase
        return true
      end
    end
    return false
  end
  
  def finished
    self.elements.each do |element|
      if element.purchase.nil?
        return false
      end
    end
    return true
  end
  
  def self.make_estimate(type)
    @templates = Template.where(:name => 'Estimate',:type => type)
    @templates.each do |t|
      e = Element.create!(:estimate_id => self.id, :item_id => t.item_id, :quantity => t.quantity, :due_at => Time.now >> 1)
      e.save
    end
  end

  
end
