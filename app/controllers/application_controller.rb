class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_login, except: [:log_in]

  def log_in #logs in the current user
  	@user = User.find_by_email(params[:email])
  	if @user.password == params[:password]
  		session[:current_user] = @user.id
  		redirect_to root_url
  	else
  		params[:error] = 'Log in failed'
  		render '/layouts/log_in', layout: false
  	end
  end

  def log_out #logs out the current user
  	session[:current_user] = nil
  	render '/layouts/log_in', layout: false
  end

  def check_login #checks that the user is logged in
  	if session[:current_user] == nil
  		render '/layouts/log_in', layout: false
  	end
  end

  def current_user #returns the current user
  	return User.find(session[:current_user])
  end
end
