class CtaController < ApplicationController
  # GET /cta
  # GET /cta.json
  def index
    @cta = Ctum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cta }
    end
  end

  # GET /cta/1
  # GET /cta/1.json
  def show
    @ctum = Ctum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ctum }
    end
  end

  # GET /cta/new
  # GET /cta/new.json
  def new
    @ctum = Ctum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ctum }
    end
  end

  # GET /cta/1/edit
  def edit
    @ctum = Ctum.find(params[:id])
  end

  # POST /cta
  # POST /cta.json
  def create
    @ctum = Ctum.new(params[:ctum])

    respond_to do |format|
      if @ctum.save
        format.html { redirect_to @ctum, notice: 'Ctum was successfully created.' }
        format.json { render json: @ctum, status: :created, location: @ctum }
      else
        format.html { render action: "new" }
        format.json { render json: @ctum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cta/1
  # PUT /cta/1.json
  def update
    @ctum = Ctum.find(params[:id])

    respond_to do |format|
      if @ctum.update_attributes(params[:ctum])
        format.html { redirect_to @ctum, notice: 'Ctum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ctum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cta/1
  # DELETE /cta/1.json
  def destroy
    @ctum = Ctum.find(params[:id])
    @ctum.destroy

    respond_to do |format|
      format.html { redirect_to cta_url }
      format.json { head :no_content }
    end
  end
end
