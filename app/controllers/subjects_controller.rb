class SubjectsController < ApplicationController

  def index
    # find all subjects so we can list them
    @subjects = Subject.sorted # generic form: Subject.all, but a sorted list is better
    # render('index') # this is done by default, so we don't need to include it
    # kirk's preview used a different syntax for render, involving json
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    # if we'd written our form differently in app/views/subjects/new.html.erb
    # we would not need to instantiate anything here, but skoglund's (personal?)
    # best practice is to include an object here,
    # b/c doing so allows us to set default values for the obj's attributes
    @subject = Subject.new({:name => 'Default Name'})
  end

  def create
    # instantiate with form parameters
    @subject = Subject.new(params[:subject])
    # save
    if @subjects.save
    # save success > redirect
      redirect_to(subjects_path)
    else
    # save fail > re-display form
      render('new')
    end
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
