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
    UserGroup.new
    @cta = Cta.find(params[:id])
    @cis = @cta.cis.uniq!
    @cis.delete(User.find(@cta.pi_id))
    @forms = @cta.forms

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cta }
    end
  end

  # GET /ctas/new
  # GET /ctas/new.json
  def new
    UserGroup.new
    @cta = Cta.create({workflow_status: 0, pi_id: current_user.id})
    ci_relation = CtaRelation.new(name: 'ci', group_type: 2, cta_id: @cta.id)
    cci_relation = CtaRelation.new(name: 'cci', group_type: 2, cta_id: @cta.id)
    ci_relation.save
    cci_relation.save
    ci_relation.users << current_user
    ci_relation.save
    cci_relation.save
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
    UserGroup.new
    @cta = Cta.new(params[:cta])
    ci_relation = CtaRelation.new(name: 'ci', group_type: 2, cta_id: @cta.id)
    cci_relation = CtaRelation.new(name: 'cci', group_type: 2, cta_id: @cta.id)
    ci_relation.save
    cci_relation.save
    params[:ci_users].each do |p|
      ci_relation.users << User.find(p)
    end
    params[:cci_users].each do |p|
      cci_relation.users << User.find(p)
    end
    ci_relation.save
    cci_relation.save

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
    params[:users].each do |p|
      @cta.cta_relations.first.users << UserGroup.find(p)
    end
    @user.user_groups.uniq!

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
    @cta = Cta.find(params[:id])
    puts '/n/n/n/n/n/n/n/n/n/n params[:status] == ' + params[:status].to_s + ' and @cta.pi_id == '+ @cta.pi_id.to_s + ' and current_user.id == ' + current_user.id.to_s
    puts (params[:status].class)
    if ((params[:status] == '2' or params[:status]=='0') and @cta.pi_id == current_user.id)
      redirect_to :back
    else
      @cta.set_status params[:status] unless @cta == nil # cci
      Mailer.cci_notification(User.find_by_email('deprepxray@gmail.com'), @cta).deliver
      redirect_to :action => "show", :id => @cta.id
    end
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
