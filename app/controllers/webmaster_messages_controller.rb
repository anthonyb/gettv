class WebmasterMessagesController < ApplicationController
  def create
    @webmaster_message = Webmaster::Message.new resource_params
    if @webmaster_message.save
      render json: :ok
    else
      render json: @webmaster_message.errors, status: :unprocessable_entity
    end
  end

  protected

  def resource_params
    params.require(:webmaster_message).permit(:subject, :reply_to, :message)
  end
end