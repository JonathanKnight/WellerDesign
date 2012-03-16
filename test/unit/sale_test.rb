require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sale.new.valid?
  end
end
