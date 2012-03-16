require 'test_helper'

class TimesheetsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Timesheet.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Timesheet.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Timesheet.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to timesheet_url(assigns(:timesheet))
  end

  def test_edit
    get :edit, :id => Timesheet.first
    assert_template 'edit'
  end

  def test_update_invalid
    Timesheet.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Timesheet.first
    assert_template 'edit'
  end

  def test_update_valid
    Timesheet.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Timesheet.first
    assert_redirected_to timesheet_url(assigns(:timesheet))
  end

  def test_destroy
    timesheet = Timesheet.first
    delete :destroy, :id => timesheet
    assert_redirected_to timesheets_url
    assert !Timesheet.exists?(timesheet.id)
  end
end
