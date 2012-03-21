class Room < ActiveRecord::Base

  attr_accessible :name, :job_id, :width, :length, :height, :windows
  
  belongs_to :job
  
  has_many :estimates
  validates_presence_of :name, :job_id
  
  def value
    v = [0,0]
    self.estimates.each do |estimate|
      evalue = estimate.value
      v[0] += evalue[0]
      v[1] += evalue[1]
    end
    v
  end

  def fullvalue
    v = [[0,0],[0,0],[0,0]]
    self.estimates.each do |estimate|
      fvalue = estimate.fullvalue
      v[0][0] += fvalue[0][0]
      v[0][1] += fvalue[0][1]
      v[1][0] += fvalue[1][0]
      v[1][1] += fvalue[1][1]
      v[2][0] += fvalue[2][0]
      v[2][1] += fvalue[2][1]
    end
    v
  end

  def started
    self.estimates.each do |estimate|
      if estimate.started
        return true
      end
    end
    return false
  end

  def self.make_estimate
    @templates = Template.where(:name => 'Room')
    @templates.each do |t|
      es = Estimate.create!(:room_id => self.id, :name => t.type)
      es.save
      es.make_estimate(t.subtype)
    end
  end

  accepts_nested_attributes_for :estimates
  
  
  
  
  
end
