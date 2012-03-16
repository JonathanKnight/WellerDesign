require 'test_helper'

class EstimatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Estimate.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Estimate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Estimate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to estimate_url(assigns(:estimate))
  end

  def test_edit
    get :edit, :id => Estimate.first
    assert_template 'edit'
  end

  def test_update_invalid
    Estimate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Estimate.first
    assert_template 'edit'
  end

  def test_update_valid
    Estimate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Estimate.first
    assert_redirected_to estimate_url(assigns(:estimate))
  end

  def test_destroy
    estimate = Estimate.first
    delete :destroy, :id => estimate
    assert_redirected_to estimates_url
    assert !Estimate.exists?(estimate.id)
  end
end
