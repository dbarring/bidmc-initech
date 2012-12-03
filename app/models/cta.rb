class Cta < ActiveRecord::Base
  attr_accessible :pi_id, :workflow_status

  def cis #returns all Users that are cis on cta

  end

  def ccis #retunrs all Users that are ccis on the cta

  end

  def forms #reutnrs all forms that are associated with the cta

  end

  def get_status #returns the status of the cta

  end

  def set_status #changes the status of the cta

  end
end
