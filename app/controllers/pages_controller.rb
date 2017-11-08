class PagesController < ApplicationController
  def index
    @pages = Page.position_sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create  #added
  end

  def edit
  end

  def update  #added
  end

  def delete
  end

  def destroy #added
  end

end
