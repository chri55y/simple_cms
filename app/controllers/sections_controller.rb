class SectionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def sections_strong_params
    params.require(:section).permit(:name, :position, :visible, :page_id)
  end

end

end
