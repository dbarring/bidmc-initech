class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if (!current_user.has_permission?('admin'))
      redirect_to :back
    end
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @permissions = UserGroup.find_all_by_group_type(1)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if (!current_user.has_permission?('admin') and @user.id != current_user.id)
      redirect_to :back
    end
    @current_permissions = @user.user_groups.all
    @permissions = UserGroup.find_all_by_group_type(1)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    params[:permissions].each do |p|
      @user.user_groups << UserGroup.find_by_name(p)
    end
    @user.user_groups.uniq!

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    params[:permissions].each do |p|
      @user.user_groups << UserGroup.find(p)
    end
    @user.user_groups.uniq!

    respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def search #filters results based on params, renders search result page
    if (!current_user.has_permission?('admin'))
      redirect_to :back
    end
    @search = params[:search].first rescue nil
    searches = @search.split(' ') rescue []
    @results = []
    searches.each do |s|
      users = User.all.delete_if{|u| u.full_name.downcase.index(s.downcase).nil? and u.email.downcase.index(s.downcase).nil?}
      @results.concat users
    end
    @results.uniq!{|x| x.id}
    render 'search'
  end
end
