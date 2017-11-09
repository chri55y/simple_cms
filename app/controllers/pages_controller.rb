class PagesController < ApplicationController
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
  end

  def update  #added
  end

  def delete
  end

  def destroy #added
  end


  private

  def page_strong_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end
end
