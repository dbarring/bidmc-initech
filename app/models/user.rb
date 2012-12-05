class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :password, :email

  validates_presence_of :first_name, :last_name, :password, :email
  validates_format_of :email, with: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  validates_format_of :password, with: /^((?=.*\d)(?=.*[a-z]).{6,20})/i, message: "must be more than 5 characters, and contain letters and numbers"
  validates_uniqueness_of :email

  #to add: internal mailing address, telephone, pager, fax

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
