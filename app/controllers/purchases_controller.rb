class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
        @purchase.element_id = params[:element_id]
        @purchase.purchase_order_id = params[:purchase_order_id]
  end

  def create
    @purchase = Purchase.new(params[:purchase])
    if @purchase.save
      redirect_to purchases_url, :notice => "Successfully created purchase."
    else
      render :new
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update_attributes(params[:purchase])
      redirect_to purchases_url, :notice  => "Successfully updated purchase."
    else
      render :edit
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_url, :notice => "Successfully destroyed purchase."
  end
end
