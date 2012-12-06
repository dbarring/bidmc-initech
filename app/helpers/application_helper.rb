module ApplicationHelper

	def current_user
		return User.find(session[:current_user])
	end
end
