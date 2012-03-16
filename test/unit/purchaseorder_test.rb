require 'test_helper'

class PurchaseorderTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Purchaseorder.new.valid?
  end
end
