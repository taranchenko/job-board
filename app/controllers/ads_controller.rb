class AdsController < ApplicationController

  before_filter :authenticate_user!, except: ['index', 'show']

  # GET /ads
  def index
    @ads = Ad.page(params[:page] ? params[:page] : 1).order('created_at DESC')
  end

  # GET /ads/1
  def show
    @ad = Ad.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to ads_url, alert: 'Invalid ad'
  end

  # GET /ads/new
  def new
    @ad = current_user.ads.new
  end

  # GET /ads/1/edit
  def edit
    @ad = current_user.ads.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to ads_url, alert: 'Invalid ad'
  end

  # POST /ads
  def create
    @ad = current_user.ads.new(prepare_attributes(:ad))

    if @ad.save
      redirect_to @ad, notice: 'Ad was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /ads/1
  def update
    @ad = current_user.ads.find(params[:id])

    if @ad.update_attributes(prepare_attributes(:ad))
      redirect_to @ad, notice: 'Ad was successfully updated.'
    else
      render action: "edit"
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to ads_url, alert: 'Invalid ad'
  end

  # DELETE /ads/1
  def destroy
    @ad = current_user.ads.find(params[:id])
    @ad.destroy
    redirect_to ads_url
  rescue ActiveRecord::RecordNotFound
    redirect_to ads_url, alert: 'Invalid ad'
  end

end
