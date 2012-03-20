class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item.supplier_id = params[:supplier_id]
    @item.category_id = params[:category_id]
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to items_url, :notice => "Successfully created item."
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to items_url, :notice  => "Successfully updated item."
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, :notice => "Successfully destroyed item."
  end
end
