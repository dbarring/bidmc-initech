class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :password, :email

  def proper_name #returns lastname, firstname
  	return self.last_name + ', ' + self.first_name
  end

  def full_name #returns firstname lastname
  	return self.first_name + ' ' + self.last_name
  end

  def get_permissions #returns all Usergroups self is in
  	return []
  end

  def related_ctas #returns all ctas self is related to
  	return []
  end
end
