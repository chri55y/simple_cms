class SectionsController < ApplicationController
  def index
    @sections = Section.position_sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
  end

  private

  def sections_strong_params
    params.require(:section).permit(:name, :position, :visible, :page_id)
  end

end

end
