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
    @sale.price_ex_vat = params[:price_ex_vat].to_f.round(2)
    @sale.price_inc_vat = params[:price_inc_vat].to_f.round(2)
    @markup = params[:markup]
    @estimate = Estimate.find(params[:estimate_id])
    @purchase_price_ex_vat = params[:purchase_price_ex_vat]
    @purchase_price_inc_vat = params[:purchase_price_inc_vat]
    session[:estimate_id] = params[:estimate_id]
  end

  def create
    if params[:sale][:markup]
      params[:sale].delete :markup
    end
    @sale = Sale.new(params[:sale])
    if @sale.save
      if session[:estimate_id]
        @estimate = Estimate.find(session[:estimate_id])
        @estimate.update_attributes(:sale_id => @sale.id)
        session[:estimate_id] = nil
      end
      redirect_to @estimate.room, :notice => "Successfully created sale."
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
