class PurchaseordersController < ApplicationController
  def index
    @purchaseorders = Purchaseorder.all
  end

  def show
    @purchaseorder = Purchaseorder.find(params[:id])
  end

  def new
    @purchaseorder = Purchaseorder.new
    @purchaseorder.supplier_id = params[:supplier_id]
    @supplier = Supplier.find(params[:supplier_id])
    @purchases = @supplier.outstanding_purchases
  end

  def create
    @purchaseorder = Purchaseorder.new(params[:purchaseorder])
    if @purchaseorder.save
      @purchases = Supplier.find(@purchaseorder.supplier_id)
      @purchases.update_attributes(:purchase_order_id => @purchaseorder.id)
      redirect_to suppliers_url, :notice => "Successfully created purchaseorder."
    else
      render :new
    end
  end

  def edit
    @purchaseorder = Purchaseorder.find(params[:id])
  end

  def update
    @purchaseorder = Purchaseorder.find(params[:id])
    if @purchaseorder.update_attributes(params[:purchaseorder])
      redirect_to purchaseorders_url, :notice  => "Successfully updated purchaseorder."
    else
      render :edit
    end
  end

  def destroy
    @purchaseorder = Purchaseorder.find(params[:id])
    @purchaseorder.destroy
    redirect_to purchaseorders_url, :notice => "Successfully destroyed purchaseorder."
  end
end
