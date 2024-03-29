class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @estimates = @room.estimates
  end

  def new
    @room = Room.new
    @room.job_id = params[:job_id]
  end

  def create
    @room = Room.new(params[:room])
    if @room.save
      redirect_to @room.job, :notice => "Successfully created room."
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      redirect_to @room.job, :notice  => "Successfully updated room."
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, :notice => "Successfully destroyed room."
  end
end
