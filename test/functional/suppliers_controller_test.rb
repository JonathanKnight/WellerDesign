require 'test_helper'

class SuppliersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Supplier.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Supplier.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Supplier.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to supplier_url(assigns(:supplier))
  end

  def test_edit
    get :edit, :id => Supplier.first
    assert_template 'edit'
  end

  def test_update_invalid
    Supplier.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Supplier.first
    assert_template 'edit'
  end

  def test_update_valid
    Supplier.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Supplier.first
    assert_redirected_to supplier_url(assigns(:supplier))
  end

  def test_destroy
    supplier = Supplier.first
    delete :destroy, :id => supplier
    assert_redirected_to suppliers_url
    assert !Supplier.exists?(supplier.id)
  end
end
