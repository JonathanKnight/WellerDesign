require 'test_helper'

class ElementsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Element.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Element.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Element.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to element_url(assigns(:element))
  end

  def test_edit
    get :edit, :id => Element.first
    assert_template 'edit'
  end

  def test_update_invalid
    Element.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Element.first
    assert_template 'edit'
  end

  def test_update_valid
    Element.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Element.first
    assert_redirected_to element_url(assigns(:element))
  end

  def test_destroy
    element = Element.first
    delete :destroy, :id => element
    assert_redirected_to elements_url
    assert !Element.exists?(element.id)
  end
end
