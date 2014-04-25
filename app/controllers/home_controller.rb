class HomeController < ApplicationController
  def index
    @questions  = Question.all
    @characters = Result.all
  end
end