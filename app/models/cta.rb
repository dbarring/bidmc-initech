class Cta < ActiveRecord::Base
  attr_accessible :pi_id, :workflow_status # 0(drafting) 1(cci) 2(irb) 3(approved) 4(denied)

  has_many :forms

  def cis #returns all Users that are cis on cta
    return CtaRelation.find_all_by_name_and_cta_id('ci', self.cta_id)
  end

  def ccis #retunrs all Users that are ccis on the cta
    return CtaRelation.find_all_by_name_and_cta_id('cci', self.cta_id)
  end

  def name #returns the name of the cta, must be gotten from its form a
    return self.form("A").hash_content[:A1][:title] rescue "CTA_#{self.id}"
  end

  def add_form part
    Form.create({part:part, cta_id:self.id})
  end

  def form part
    return Form.find_by_cta_id_and_part(self.id, part)
  end

  def forms #returns all forms that are associated with the cta
    return Form.find_all_by_cta_id(self.id)
  end

  def get_status #returns the status of the cta
    return CTA_STATUS[self.workflow_status]
  end

  def set_status status #changes the status of the cta
    self.update_attributes({workflow_status: status })
  end
end
