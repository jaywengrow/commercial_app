class PagesController < ApplicationController
  def home
    @title = "Welcome to Commercial.ize!"
  end

  def contact
    @title = "Contact us!"
  end

  def about
    @title = "About us!"
  end

end
