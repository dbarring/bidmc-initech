class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :password, :email

  validates_presence_of :first_name, :last_name, :password, :email
  validates_format_of :email, with: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  validates_format_of :password, with: /^((?=.*\d)(?=.*[a-z]).{6,20})/i, message: "must be more than 5 characters, and contain letters and numbers"
  validates_uniqueness_of :email

  has_and_belongs_to_many :user_groups

  #to add: internal mailing address, telephone, pager, fax

  def proper_name #returns lastname, firstname
  	return self.last_name + ', ' + self.first
  end

  def full_name #returns firstname lastname
  	return self.first_name + ' ' + self.last_name
  end

  def has_permission? permission
    return !self.user_groups.find_by_name(permission).nil?
  end

  def get_permissions #returns all Usergroups self is in
  	return self.user_groups.find_all_by_group_type(1).uniq!
  end

  def related_ctas #returns all ctas self is related to
  	ctas = []
    ctas.concat Cta.find_all_by_pi_id(self.id)
    #ctas.concat ci ctas
    #ctas.concat dep rep ctas
    #ctas.concat cci ctas
    #ctas.concat irb ctas
    return ctas
  end

  def is_password? password
    return (password == self.password)
  end
end
