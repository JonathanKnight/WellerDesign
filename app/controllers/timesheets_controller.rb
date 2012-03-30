class TimesheetsController < ApplicationController
  def index
    @timesheets = Timesheet.order('created_at desc').page(params[:page]).per_page(10)
    @open_elements = Element.open_tasks
  end

  def show
    @timesheet = Timesheet.find(params[:id])
  end

  def new
    @timesheet = Timesheet.new
    @timesheet.user_id = params[:user_id]
    @timesheet.element_id = params[:element_id]
    @timesheet.opened_at = Time.now
    @timesheet.closed_at = nil
    @timesheet.chargeable = true
  end

  def create
    @timesheet = Timesheet.new(params[:timesheet])
    if @timesheet.save
      redirect_to timesheets_url, :notice => "Successfully created timesheet."
    else
      render :new
    end
  end

  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  def update
    @timesheet = Timesheet.find(params[:id])
    if @timesheet.update_attributes(params[:timesheet])
      redirect_to timesheets_url, :notice  => "Successfully updated timesheet."
    else
      render :edit
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy
    redirect_to timesheets_url, :notice => "Successfully destroyed timesheet."
  end
end
