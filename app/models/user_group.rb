class UserGroup < ActiveRecord::Base
  attr_accessible :name, :group_type
  has_and_belongs_to_many :users


  def type
    if (self.group_type == 1)
      return "Permission"
    elsif (self.group_type == 2)
      return "CtaRelation"
    elsif (self.group_type == 3)
      return "Department"
    end
    return "UserGroup"
  end
end

class Permission < UserGroup
  def self.model_name
    UserGroup.model_name
  end
  #links user(s) to permission role
	#admin, irb, cci, investigator, dep_rep
end

class CtaRelation < UserGroup
  belongs_to :cta

  def self.model_name
    UserGroup.model_name
  end
	#used to link user to cta in either 'ci' or 'cci'
  #set up cta_user_group table
end

class Department < UserGroup
  def self.model_name
    UserGroup.model_name
  end
	#links user to department
end