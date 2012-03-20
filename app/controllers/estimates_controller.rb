class EstimatesController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
    @elements = @estimate.elements.page(params[:page]).per_page(15)
  end

  def new
    @estimate = Estimate.new
    @estimate.room_id = params[:room_id]
    @estimate.sale_id = params[:sale_id]
  end

  def create
    @estimate = Estimate.new(params[:estimate])
    if @estimate.save
      redirect_to estimates_url, :notice => "Successfully created estimate."
    else
      render :new
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update_attributes(params[:estimate])
      redirect_to estimates_url, :notice  => "Successfully updated estimate."
    else
      render :edit
    end
  end

  def destroy
    @estimate = Estimate.find(params[:id])
    @estimate.destroy
    redirect_to estimates_url, :notice => "Successfully destroyed estimate."
  end
end
