class HomeController < ApplicationController
  def index
    @questions  = Question.all
    @characters = Result.all
    @genres     = Genre.all
  end
end