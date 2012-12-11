class UserGroup < ActiveRecord::Base
  attr_accessible :name, :type

  def add_user #adds a user to the group

  end

  def remove_user #removes a user from the group

  end

  def union(group) #returns all users in both groups

  end
end

class Permission < UserGroup
	#admin, irb, cci, investigator, dep_rep

	#set up cta_user_group table
	#set up user_user_group table

end

class CtaRelation < UserGroup
	#used to link user to cta in either 'ci' or 'cci'
end

class Department < UserGroup
	#radiology, toxicology...
end