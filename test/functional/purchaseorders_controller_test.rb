require 'test_helper'

class PurchaseordersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Purchaseorder.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Purchaseorder.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Purchaseorder.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to purchaseorder_url(assigns(:purchaseorder))
  end

  def test_edit
    get :edit, :id => Purchaseorder.first
    assert_template 'edit'
  end

  def test_update_invalid
    Purchaseorder.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Purchaseorder.first
    assert_template 'edit'
  end

  def test_update_valid
    Purchaseorder.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Purchaseorder.first
    assert_redirected_to purchaseorder_url(assigns(:purchaseorder))
  end

  def test_destroy
    purchaseorder = Purchaseorder.first
    delete :destroy, :id => purchaseorder
    assert_redirected_to purchaseorders_url
    assert !Purchaseorder.exists?(purchaseorder.id)
  end
end
