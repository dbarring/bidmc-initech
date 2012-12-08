class CtasController < ApplicationController
  # GET /ctas
  # GET /ctas.json
  def index
    @ctas = Cta.all
    @related_ctas = current_user.related_ctas
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ctas }
    end
  end

  # GET /ctas/1
  # GET /ctas/1.json
  def show
    @cta = Cta.find(params[:id])
    @cis = @cta.cis
    @forms = @cta.forms

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cta }
    end
  end

  # GET /ctas/new
  # GET /ctas/new.json
  def new
    @cta = Cta.create({workflow_status: 0, pi_id: current_user.id})
    redirect_to (@cta.add_form 'A'), action: :edit
  end

  # GET /ctas/1/edit
  def edit
    @cta = Cta.find(params[:id])
  end

  # POST /ctas
  # POST /ctas.json
  def create
    params[:cta][:workflow_status] = 0
    @cta = Cta.new(params[:cta])

    respond_to do |format|
      if @cta.save
        format.html { redirect_to @cta, notice: 'Cta was successfully created.' }
        format.json { render json: @cta, status: :created, location: @cta }
      else
        format.html { render action: "new" }
        format.json { render json: @cta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ctas/1
  # PUT /ctas/1.json
  def update
    @cta = Cta.find(params[:id])

    respond_to do |format|
      if @cta.update_attributes(params[:cta])
        format.html { redirect_to @cta, notice: 'Cta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ctas/1
  # DELETE /ctas/1.json
  def destroy
    @cta = Cta.find(params[:id])
    @cta.destroy

    respond_to do |format|
      format.html { redirect_to ctas_url }
      format.json { head :no_content }
    end
  end

  def document #renders the full document view
    render 'document'
  end

  def add_form #adds a form of type passed in params

  end

  def set_status #changes the approval stage of the cta

  end
  
  def add_ci #adds user to cta as ci

  end

  def remove_ci #removes user from cta

  end

  def add_cci #adds user to cta as cci

  end

  def remove_cci #removes user from cta

  end

  def search #limits results based on params, renders search result page
    @search = params[:search].first rescue nil
    render 'search'
  end

  def upload #attatches file to cta.

  end
end
