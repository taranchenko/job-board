class RepliesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @ad = Ad.find(params[:ad_id])
    @reply = @ad.replies.new(params[:reply])
    @reply.user = current_user
    if @reply.save
      redirect_to @ad, :notice => 'Thanks for your reply'
    else
      redirect_to @ad, :alert => 'Unable to add reply'
    end
  end

  def destroy
    @ad = current_user.ads.find(params[:ad_id])
    @reply = @ad.replies.find(params[:id])
    @reply.destroy
    redirect_to @ad, :notice => 'Reply deleted'
  end
end
