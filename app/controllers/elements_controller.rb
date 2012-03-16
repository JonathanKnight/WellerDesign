class ElementsController < ApplicationController
  def index
    @elements = Element.all
  end

  def show
    @element = Element.find(params[:id])
  end

  def new
    @element = Element.new
        @element.estimate_id = params[:estimate_id]
        @element.item_id = params[:item_id]
  end

  def create
    @element = Element.new(params[:element])
    if @element.save
      redirect_to elements_url, :notice => "Successfully created element."
    else
      render :new
    end
  end

  def edit
    @element = Element.find(params[:id])
  end

  def update
    @element = Element.find(params[:id])
    if @element.update_attributes(params[:element])
      redirect_to elements_url, :notice  => "Successfully updated element."
    else
      render :edit
    end
  end

  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    redirect_to elements_url, :notice => "Successfully destroyed element."
  end
end
