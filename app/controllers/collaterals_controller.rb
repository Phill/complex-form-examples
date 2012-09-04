class CollateralsController < ApplicationController
  # GET /collaterals
  # GET /collaterals.json
  def index
    @collaterals = Collateral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collaterals }
    end
  end

  # GET /collaterals/1
  # GET /collaterals/1.json
  def show
    @collateral = Collateral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collateral }
    end
  end

  # GET /collaterals/new
  # GET /collaterals/new.json
  def new
    @collateral = Collateral.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collateral }
    end
  end

  # GET /collaterals/1/edit
  def edit
    @collateral = Collateral.find(params[:id])
  end

  # POST /collaterals
  # POST /collaterals.json
  def create
    @collateral = Collateral.new(params[:collateral])

    respond_to do |format|
      if @collateral.save
        format.html { redirect_to @collateral, notice: 'Collateral was successfully created.' }
        format.json { render json: @collateral, status: :created, location: @collateral }
      else
        format.html { render action: "new" }
        format.json { render json: @collateral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collaterals/1
  # PUT /collaterals/1.json
  def update
    @collateral = Collateral.find(params[:id])

    respond_to do |format|
      if @collateral.update_attributes(params[:collateral])
        format.html { redirect_to @collateral, notice: 'Collateral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collateral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaterals/1
  # DELETE /collaterals/1.json
  def destroy
    @collateral = Collateral.find(params[:id])
    @collateral.destroy

    respond_to do |format|
      format.html { redirect_to collaterals_url }
      format.json { head :no_content }
    end
  end
end
