class SubmissionController < ApplicationController
  def create
    @submission = Webmaster::Message.new resource_params
    if @submission.save
      render json: :ok
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  protected

  def resource_params
    params.require(:submission).permit(:subject, :reply_to, :message)
  end
end