class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
    @sale.quantity = params[:quantity]
    @sale.price_ex_vat = params[:price_ex_vat]
    @sale.price_inc_vat = params[:price_inc_vat]
  end

  def create
    @sale = Sale.new(params[:sale])
    if @sale.save
      redirect_to sales_url, :notice => "Successfully created sale."
    else
      render :new
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update_attributes(params[:sale])
      redirect_to sales_url, :notice  => "Successfully updated sale."
    else
      render :edit
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_url, :notice => "Successfully destroyed sale."
  end
end
