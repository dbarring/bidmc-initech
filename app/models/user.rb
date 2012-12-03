class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :password, :email

  def proper_name #returns lastname, firstname

  end

  def full_name #returns firstname lastname
  	self.first_name + ' ' + self.last_name
  end

  def get_permissions #returns all Usergroups self is in

  end

  def related_ctas #returns all ctas self is related to

  end
end
