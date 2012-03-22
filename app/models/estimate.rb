class Estimate < ActiveRecord::Base

  attr_accessible :name, :room_id, :sale_id, :elements_attributes
  belongs_to :room
  has_many :elements, :inverse_of => :estimate
  accepts_nested_attributes_for :elements
  belongs_to :sale
  validates_presence_of :name,:room_id
  
  def quantities
    q = ""
    self.elements.each do |element|
      q+= "#{element.quantity}x#{element.item.supplier.name} #{element.item.name} #{element.item.code} "
    end
    q
  end

  def quantity
    if self.elements.count == 1
      self.elements.first.quantity
    else
      1
    end
  end
  
  def price_ex_vat
    if self.elements.count == 1
      self.elements.first.item.price_ex_vat
    else
      self.value[0]
    end
  end
  
  def price_inc_vat
    if self.elements.count == 1
      self.elements.first.item.price_inc_vat
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

  def fullvalue
    e = [0,0]
    p = [0,0]
    s = [0,0]
    self.elements.each do |element|
      e[0] += element.value[0]
      e[1] += element.value[1]
      purch = element.purchase
      if purch
      p[0] += purch.quantity*purch.price_ex_vat
      p[1] += purch.quantity*purch.price_ex_vat
      end
    end
    if self.sale
    s[0] += self.sale.quantity*self.sale.price_ex_vat
    s[1] += self.sale.quantity*self.sale.price_inc_vat
    end
    [e,p,s]
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
