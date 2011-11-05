class RepliesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @ad = Ad.find(params[:ad_id])
    @reply = @ad.replies.new(prepare_attributes(:reply))
    @reply.user = current_user
    if @reply.save
      Notifier.email_reply(@reply).deliver
      redirect_to @ad, notice: 'Thanks for your reply'
    else
      redirect_to @ad, alert: 'Unable to add reply'
    end
  end

  def destroy
    @ad = current_user.ads.find(params[:ad_id])
    @reply = @ad.replies.find(params[:id])
    @reply.destroy
    redirect_to @ad, notice: 'Reply deleted'
  rescue ActiveRecord::RecordNotFound
    redirect_to ads_url, alert: 'Invalid reply'
  end
end
