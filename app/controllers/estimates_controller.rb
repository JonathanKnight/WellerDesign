class EstimatesController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])
    @elements = @estimate.elements.page(params[:page]).per_page(15)
    @fullvalue = @estimate.fullvalue
  end

  def new
    @estimate = Estimate.new
    @estimate.room_id = params[:room_id]
    @estimate.sale_id = params[:sale_id]
    #@estimate.elements.build
    @suppliers = Supplier.order("name")
  end

  def create
    if params[:estimate][:suppliers]
      params[:estimate].delete :suppliers    
    end
    puts params
    @estimate = Estimate.new(params[:estimate])
    if @estimate.save!
      redirect_to @estimate.room, :notice => "Successfully created estimate."
    else
      render :new
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
    @elements = @estimate.elements
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update_attributes(params[:estimate])
      redirect_to @estimate.room, :notice  => "Successfully updated estimate."
    else
      render :edit
    end
  end

  def destroy
    @estimate = Estimate.find(params[:id])
    @room = @estimate.room
    @estimate.destroy
    redirect_to @room, :notice => "Successfully destroyed estimate."
  end
end
