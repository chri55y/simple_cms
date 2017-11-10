class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.position_sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
    @pages = Page.position_sorted
  end

  def create
    @section = Section.new(section_strong_params)
    if @section.save
      flash[:notice] = "Successfully created Section"
      redirect_to(sections_path)
    else
      @section_count = Section.count + 1
      @pages = Page.position_sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.position_sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_strong_params)
      flash[:notice] = "Successfully updated Section"
      redirect_to(section_path(params[:id]))
    else
      @section_count = Section.count
      @pages = Page.position_sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice]  = "Section '#{@section.name}' DELETED"
    redirect_to(sections_path)
  end

  private

  def section_strong_params
    params.require(:section).permit(:name, :position, :visible, :page_id)
  end

end