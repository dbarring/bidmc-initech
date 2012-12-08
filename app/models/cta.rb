class Cta < ActiveRecord::Base
  attr_accessible :pi_id, :workflow_status

  has_many :forms

  def cis #returns all Users that are cis on cta
    return []
  end

  def ccis #retunrs all Users that are ccis on the cta
    return []
  end

  def name #returns the name of the cta, must be gotten from its form a
    'cta_'+self.id.to_s
  end

  def add_form part
    Form.create({part:part, cta_id:self.id})
  end

  def forms #reutnrs all forms that are associated with the cta
    return Form.find_all_by_cta_id(self.id)
  end

  def get_status #returns the status of the cta
    return CTA_STATUS[self.workflow_status]
  end

  def set_status #changes the status of the cta
    
  end
end
