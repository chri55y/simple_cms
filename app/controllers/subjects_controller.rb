class SubjectsController < ApplicationController

  def index
    # find all subjects so we can list them
    @subjects = Subject.sorted # generic form: Subject.all, but a sorted list is better
    # render('index') # this is done by default, so we don't need to include it
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

end
