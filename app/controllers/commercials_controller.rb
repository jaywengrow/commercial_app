class CommercialsController < ApplicationController
	before_filter :authenticate
	
  def index
  end

  def show
  end

  def new
  end

  def create
  	@commercial = current_user.commercials.build(params[:commercial])
  	if @commercial.save
  		flash[:success] = "Commercial created!"
  	else
  		flash[:error] = "Commercial not created."
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
