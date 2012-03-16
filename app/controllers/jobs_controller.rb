class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
        @job.client_id = params[:client_id]
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to jobs_url, :notice => "Successfully created job."
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
      redirect_to jobs_url, :notice  => "Successfully updated job."
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
