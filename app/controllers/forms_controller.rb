class FormsController < ApplicationController

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])
    @cta = Cta.find(@form.cta_id)
    @contents = @form.hash_content
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new
    @cta = Cta.find(params[:cta_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
    @contents = @form.hash_content
    @investigators = User.all  #make this only users with investigator permission.
    @users = User.all
    redirect_to :back unless (@form.editor_id.nil? or @form.editor_id == current_user.id)
    @form.update_attribute(:editor_id, current_user.id)
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render json: @form, status: :created, location: @form }
      else
        format.html { render action: "new" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attribute(:content, params[:content])
        @form.update_attribute(:editor_id, nil)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end

  def check_in #sets editor_id to nil, freeing form up for editting

  end

  def check_out #sets editor_id to current_user for editing

  end

  def printable #renders a printable version of the form
    render 'printable'
  end

  def add_note #saves the cci or irb note

  end

  def version_revert #reverts to previous version, leaving a new version indicating the action

  end
end
