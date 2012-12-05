User.find_or_create_by_email('admin@bidmc.com').update_attributes({first_name:'Steve', last_name:'Willis', password:'panama123'})

if Cta.all.length == 0
	Cta.create({pi_id:User.find_by_email('admin@bidmc.com').id, workflow_status: 1})
	Cta.create({pi_id:User.find_by_email('admin@bidmc.com').id, workflow_status: 2})
end