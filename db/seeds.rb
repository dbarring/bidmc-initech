User.find_or_create_by_email('admin@bidmc.com').update_attributes({first_name:'Steve', last_name:'Willis', password:'panama123'})
User.find_or_create_by_email('investigator@bidmc.com').update_attributes({first_name:'Tyler', last_name:'Karuzis', password:'panama123'})
User.find_or_create_by_email('cci@bidmc.com').update_attributes({first_name:'Sean', last_name:'Madigan', password:'panama123'})
User.find_or_create_by_email('pharmacy@bidmc.com').update_attributes({first_name:'Dan', last_name:'Barrington', password:'panama123'})
User.find_or_create_by_email('irb@bidmc.com').update_attributes({first_name:'Dylan', last_name:'Williams', password:'panama123'})
User.find_or_create_by_email('ccii@bidmc.com').update_attributes({first_name:'Brian', last_name:'Nolin', password:'panama123'})
User.find_or_create_by_email('deprepxray@gmail.com').update_attributes({first_name:'Bobby', last_name:'Xrays', password:'panama123'})

UserGroup.new
Permission.find_or_create_by_name('admin').update_attributes({group_type: 1})
Permission.find_or_create_by_name('irb').update_attributes({group_type: 1})
Permission.find_or_create_by_name('cci').update_attributes({group_type: 1})
Permission.find_or_create_by_name('investigator').update_attributes({group_type: 1})
Permission.find_or_create_by_name('dep_rep').update_attributes({group_type: 1})
User.find_by_email('admin@bidmc.com').user_groups << Permission.find_by_name('admin')
User.find_by_email('investigator@bidmc.com').user_groups << Permission.find_by_name('investigator')
User.find_by_email('cci@bidmc.com').user_groups << Permission.find_by_name('cci')
User.find_by_email('pharmacy@bidmc.com').user_groups << Permission.find_by_name('dep_rep')
User.find_by_email('irb@bidmc.com').user_groups << Permission.find_by_name('irb')
User.find_by_email('ccii@bidmc.com').user_groups << Permission.find_by_name('cci')
Department.find_or_create_by_name('radiology').update_attributes({group_type: 3})
Department.find_or_create_by_name('toxicology').update_attributes({group_type: 3})
Department.find_or_create_by_name('pharmacy').update_attributes({group_type: 3})
User.find_by_email('pharmacy@bidmc.com').user_groups << Department.find_by_name('pharmacy')

if Cta.all.length == 0
	c = Cta.create({pi_id:User.find_by_email('ccii@bidmc.com').id, workflow_status: 0})

	Form.create({part: 'A', cta_id: c.id})
	Form.create({part: 'E', cta_id: c.id})
  ci_relation = CtaRelation.create({name: 'ci', group_type: 2, cta_id: c.id})
  cci_relation = CtaRelation.create({name: 'cci', group_type: 2, cta_id: c.id})
  ci_relation.users << User.find_by_email('investigator@bidmc.com')
  ci_relation.users << User.find_by_email('ccii@bidmc.com')
  cci_relation.users << User.find_by_email('cci@bidmc.com')
  cci_relation.users << User.find_by_email('ccii@bidmc.com')
  ci_relation.save
  cci_relation.save
end