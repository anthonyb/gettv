class SubmissionsController < ApplicationController
  def create
    if params[:submission].has_key?('phone')
      # honeypot
      render json: :okay
    else params[:submission].has_key?('phone')
      @submission = Submission.new resource_params
      if @submission.save
        render json: :ok
      else
        render json: @submission.errors, status: :unprocessable_entity
      end
    end
  end

  protected

  def resource_params
    params.require(:submission).permit(:email, :full_name, :zip_code, :favorite_genre, :character, :answers)
  end
end
