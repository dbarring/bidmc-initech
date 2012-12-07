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

end

class CtaRelation < UserGroup

end