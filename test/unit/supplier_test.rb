require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Supplier.new.valid?
  end
end
