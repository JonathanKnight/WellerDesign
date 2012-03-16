require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Timesheet.new.valid?
  end
end
