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
    @subject = Subject.new(subject_params)
    # save
    if @subject.save
    # save success > redirect
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    else
    # save fail > re-display form
      render('new')
    end
  end

  def edit
    # find record (same as show method)
    @subject = Subject.find(params[:id])
  end

  def update
    # find objects
    @subject = Subject.find(params[:id])
    # update via update_attributes
    if @subject.update_attributes(subject_params)
      # update success > redirect to show
      flash[:notice] = "Subject updated successfully."
      redirect_to(subject_path(@subject))
    else
      # update fail > re-display form
      render('edit')
    end
  end

  def delete
    # find record
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to(subjects_path)
  end

  private

  # moved this from create method so it can be used in update
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
