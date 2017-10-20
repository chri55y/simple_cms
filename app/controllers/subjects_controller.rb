class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all # controller talking to model
    render json: @subjects

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
