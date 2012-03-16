require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Purchase.new.valid?
  end
end
