class PagesController < ApplicationController
  def index
    @pages = Pages.position_sorted
  end

  def show
  end

  def new
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
