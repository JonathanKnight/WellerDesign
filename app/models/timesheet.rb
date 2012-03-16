class Timesheet < ActiveRecord::Base

  attr_accessible :user_id, :element_id, :description, :opened_at, :closed_at, :chargeable
  belongs_to :user
  
  belongs_to :element
  def self.summary(user_id)
    if user_id
    Timesheet.where(:user_id => user_id).
      joins(:element => :item).joins(:element => {:estimate => :job}).
      select("timesheets.day,jobs.name,sum(elements.quantity*items.price_inc_vat) as total, sum(elements.quantity) as total_hours").
      group('timesheets.day,jobs.id')
    else
    Timesheet.joins(:element => :item).joins(:element => {:estimate => :job}).
      select("timesheets.day,jobs.name,sum(elements.quantity*items.price_inc_vat) as total, sum(elements.quantity) as total_hours").
      group('timesheets.day,jobs.id')
    end
  end
  
  def self.current_task(user_id)
    t = Timesheet.where(:user_id => user_id).where(:closed_at => nil).first
    t.nil? ? t : t.id
  end
  
  def self.current_tasks(user_id)
    if user_id
      t = Timesheet.where(:user_id => user_id).where(:closed_at => nil)
    else
      t = Timesheet.where(:closed_at => nil)      
    end
  end
  
  def self.create_close_open(user_id,element_id)
    @open = Timesheet.current_tasks(user_id)
    @open.each do |open|
      open.update_attributes(:closed_at => Time.now)
    end
    @timesheet = Timesheet.create!(:user_id => user_id, :element_id => element_id, :chargeable => true,
        :day => Date.today,:opened_at => Time.now )
  end

  def self.close_timesheet(element_id)
    @timesheets = Timesheet.where(:element_id => element_id)
    hours = 0.0
    @timesheets.each do |t|
      if t.closed_at.nil?
        t.update_attributes(:closed_at => Time.now)
      end
      hour = ((t.closed_at - t.opened_at)/60.0/60.0).round(1)
      hours += hour
    end
    hours
  end

  
  
  
  
  
end
