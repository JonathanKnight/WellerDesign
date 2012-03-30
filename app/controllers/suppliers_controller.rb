class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.order("name").page(params[:page]).per_page(10)
        logger.debug request.env["HTTP_USER_AGENT"]
  end

  def show
    @supplier = Supplier.find(params[:id])
    @items = @supplier.items.order("name").page(params[:page]).per_page(10)
    @purchases = @supplier.purchases
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to suppliers_url, :notice => "Successfully created supplier."
    else
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(params[:supplier])
      redirect_to suppliers_url, :notice  => "Successfully updated supplier."
    else
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy
    redirect_to suppliers_url, :notice => "Successfully destroyed supplier."
  end
end
