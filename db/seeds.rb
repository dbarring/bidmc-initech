User.find_or_create_by_email('admin@bidmc.com').update_attributes({first_name:'Steve', last_name:'Willis', password:'panama123'})
User.find_or_create_by_email('investigator@bidmc.com').update_attributes({first_name:'Tyler', last_name:'Karuzis', password:'panama123'})
User.find_or_create_by_email('cci@bidmc.com').update_attributes({first_name:'Sean', last_name:'Madigan', password:'panama123'})
User.find_or_create_by_email('radiologist@bidmc.com').update_attributes({first_name:'Dan', last_name:'Barrington', password:'panama123'})
User.find_or_create_by_email('irb@bidmc.com').update_attributes({first_name:'Dylan', last_name:'Williams', password:'panama123'})
User.find_or_create_by_email('ccii@bidmc.com').update_attributes({first_name:'Brian', last_name:'Nolin', password:'panama123'})
User.find_or_create_by_email('deprepxray@gmail.com').update_attributes({first_name:'Bobby', last_name:'Xrays', password:'panama123'})

UserGroup.new
Permission.find_or_create_by_name('admin').update_attributes({group_type: 1})
Permission.find_or_create_by_name('irb').update_attributes({group_type: 1})
Permission.find_or_create_by_name('cci').update_attributes({group_type: 1})
Permission.find_or_create_by_name('investigator').update_attributes({group_type: 1})
Permission.find_or_create_by_name('dep_rep').update_attributes({group_type: 1})
Permission.find_or_create_by_name()
User.find_by_email('admin@bidmc.com').user_groups << Permission.find_by_name('admin')

if Cta.all.length == 0
	Cta.create({pi_id:User.find_by_email('admin@bidmc.com').id, workflow_status: 0}) do |c|
		Form.create({part: 'A', cta_id: c.id})
		Form.create({part: 'B', cta_id: c.id})
	end
	Cta.create({pi_id:User.find_by_email('admin@bidmc.com').id, workflow_status: 0}) do |c|
		Form.create({part: 'A', cta_id: c.id})
	end
end