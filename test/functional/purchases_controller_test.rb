require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Purchase.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Purchase.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Purchase.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to purchase_url(assigns(:purchase))
  end

  def test_edit
    get :edit, :id => Purchase.first
    assert_template 'edit'
  end

  def test_update_invalid
    Purchase.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Purchase.first
    assert_template 'edit'
  end

  def test_update_valid
    Purchase.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Purchase.first
    assert_redirected_to purchase_url(assigns(:purchase))
  end

  def test_destroy
    purchase = Purchase.first
    delete :destroy, :id => purchase
    assert_redirected_to purchases_url
    assert !Purchase.exists?(purchase.id)
  end
end
