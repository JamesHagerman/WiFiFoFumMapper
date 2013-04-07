class AccessPointsController < ApplicationController
  # GET /access_points
  # GET /access_points.json
  def index
    @access_points = AccessPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @access_points }
    end
  end

  # GET /access_points/1
  # GET /access_points/1.json
  def show
    @access_point = AccessPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @access_point }
    end
  end

  # GET /access_points/new
  # GET /access_points/new.json
  def new
    @access_point = AccessPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @access_point }
    end
  end

  # GET /access_points/1/edit
  def edit
    @access_point = AccessPoint.find(params[:id])
  end

  # POST /access_points
  # POST /access_points.json
  def create
    @access_point = AccessPoint.new(params[:access_point])

    respond_to do |format|
      if @access_point.save
        format.html { redirect_to @access_point, notice: 'Access point was successfully created.' }
        format.json { render json: @access_point, status: :created, location: @access_point }
      else
        format.html { render action: "new" }
        format.json { render json: @access_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /access_points/1
  # PUT /access_points/1.json
  def update
    @access_point = AccessPoint.find(params[:id])

    respond_to do |format|
      if @access_point.update_attributes(params[:access_point])
        format.html { redirect_to @access_point, notice: 'Access point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @access_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_points/1
  # DELETE /access_points/1.json
  def destroy
    @access_point = AccessPoint.find(params[:id])
    @access_point.destroy

    respond_to do |format|
      format.html { redirect_to access_points_url }
      format.json { head :no_content }
    end
  end
end
