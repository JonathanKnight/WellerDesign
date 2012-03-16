require 'test_helper'

class EstimateTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Estimate.new.valid?
  end
end
