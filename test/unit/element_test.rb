require 'test_helper'

class ElementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Element.new.valid?
  end
end
