class HomeController < ApplicationController
  def index
    @questions  = Question.all
    @characters = Result.all
    @genres     = Genre.all
    @answers    = Answer.all
  end
end