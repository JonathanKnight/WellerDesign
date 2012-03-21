class JobsController < ApplicationController
  def index
    @jobs = Job.order("name").page(params[:page]).per_page(10)
  end

  def show
    @job = Job.find(params[:id])
    @rooms = @job.rooms
    @fullvalue = @job.fullvalue
  end

  def new
    @job = Job.new
        @job.client_id = params[:client_id]
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to @job.client, :notice => "Successfully created job."
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      redirect_to @job.client, :notice  => "Successfully updated job."
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, :notice => "Successfully destroyed job."
  end
end
