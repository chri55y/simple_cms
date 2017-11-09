class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.position_sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:position => 1+(Page.position_sorted.last.position)})
  end

  def create  #added
    # instantiate
    @page = Page.new(page_strong_params)  #(params[:page])
    # save
    if @page.save
      # success
      flash[:notice] = "Page '#{@page.name}' created successfully."
      redirect_to(pages_path)
    else
      # failure
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update  #added
    # find
    @page = Page.find(params[:id])
    # update
    if @page.update_attributes(page_strong_params)
      # success
      flash[:notice] = "Page '#{@page.name}' updated successfully."
      redirect_to(page_path(params[:id]))
    else
      # failure
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy #added
    # find
    @page = Page.find(params[:id])
    # destroy
    @page.destroy
    # redirect
    flash[:notice] = "Page '#{@page.name}' successfully destroyed"
    redirect_to(pages_path)
  end


  private

  def page_strong_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end
end
