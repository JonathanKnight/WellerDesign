class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end

  def show
    @template = Template.find(params[:id])
  end

  def new
    @template = Template.new
        @template.item_id = params[:item_id]
  end

  def create
    @template = Template.new(params[:template])
    if @template.save
      redirect_to templates_url, :notice => "Successfully created template."
    else
      render :new
    end
  end

  def edit
    @template = Template.find(params[:id])
  end

  def update
    @template = Template.find(params[:id])
    if @template.update_attributes(params[:template])
      redirect_to templates_url, :notice  => "Successfully updated template."
    else
      render :edit
    end
  end

  def destroy
    @template = Template.find(params[:id])
    @template.destroy
    redirect_to templates_url, :notice => "Successfully destroyed template."
  end
end
