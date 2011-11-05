class AdsController < ApplicationController

  before_filter :authenticate_user!, except: ['index', 'show']

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.page(params[:page] ? params[:page] : 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    @ad = Ad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ad }
    end
  end

  # GET /ads/new
  # GET /ads/new.json
  def new
    @ad = current_user.ads.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ad }
    end
  end

  # GET /ads/1/edit
  def edit
    @ad = current_user.ads.find(params[:id])
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = current_user.ads.new(params[:ad])

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render json: @ad, status: :created, location: @ad }
      else
        format.html { render action: "new" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.json
  def update
    attrs = params[:ad]
    attrs.delete(:user)
    attrs.delete(:user_id)
    @ad = current_user.ads.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(attrs)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad = current_user.ads.find(params[:id])
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url }
      format.json { head :ok }
    end
  end
end
