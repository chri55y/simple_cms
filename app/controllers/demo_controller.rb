class DemoController < ApplicationController
	
	layout 'application'  # 'application' layout is default, so this explicity is not necessary
	
	def index
    render ('index')    # default, what would be done if nothing was defined here
	end

  def hello       
    @array = [1,2,3,4,5]  
      # @ makes this an instance variable, so can be accessed in template
    @id = params['id']      # == params[:id]
    @page = params[:page]   # == params['page']
    render ('hello')   
  end

  def other_hello
    redirect_to(:action => 'index')
  end

  def lynda
    redirect_to('http://lynda.com')
  end

  def escape_output

  end

end
