if true return false
#the pages are now being invividually editted, don't run this.



require "Date"

bool = true
int = 1
string = 'a'
date = Date.new
forms = {}
forms[:A] = {full_board: bool, expedited: bool, A1: {title: string, short_title: string}, A2: {  pi_id: int, ci_ids: [int], main_contact_id: int }, A3: {  type: { a: bool, b: bool, c: bool, d: bool, e: bool, f: bool, g: bool, h: bool, i: bool, j: bool, k: bool, l: bool, m: bool, n: bool, o: bool, p: bool, p_e: string }, design: { a: bool,b: bool,c: bool }, phase: {  i: bool,i_ii: bool,ii: bool,ii_iii: bool,iii: bool,iiii: bool,other: bool,other_e: string }, placebo: bool },A4: { A: {  ab: bool,ad: date,bb: bool},B: {  ab: bool,as: string,bs: string,bb: bool,cb: bool },C: {  a1: { conflict: bool,consulting: bool,management: bool,employment: bool,board_directors: bool,scientific_board: bool,stock: bool,royalties: bool,ip_rights: bool,author: bool,gift: bool,loan: bool,other: bool,other_explained: string },a2: bool,a3: { b: bool,s: string } }},A5: { nurse: bool,drugs: bool,xray: bool,investigation: bool,lab: bool,transfusion: bool,radio: bool,clinical: bool,infectious: bool,genetic: bool,hazardous: bool,expedited: bool,records: bool,tissue: bool,other: bool},A6: {   from: date,to: date },A7: { A: {  others: bool,num: int },B: {  lead: bool,institutions: [ { site: string,irb: bool,permission: bool,irb_contact: string,irb_approval: bool } ] } }, A8: { no_funding: bool,reason: string,yes_funding: bool,industry: bool,federal: bool,foundation: bool,internal: bool,free: bool,A: {  industry: bool,industry_entity: string,investigator_external: bool,investigator_external_entity: string,investigator_internal: bool,investigator_internal_entity: string },B: {  office_name: string,office_date: date,ra_name: string,ra_date: date },C: {  review: bool,approved: bool,supported: bool,other: bool,reason: string },D: {  dollars: string,non_monetary: string,one_site: bool,multi_site: bool,fed_grant_yes: bool,fed_grant_no: bool,institution: string,defense: bool },E: {  b_y: bool,b_n: bool,s: string },F: {  grant: int,g_date: date,funded: bool,pending: bool },G: {  a: bool,b: bool,c: bool,d: bool,e: bool,  f: bool,  g: bool,  h: bool,  i: bool,  j: bool,  k: bool,  l: bool,  m: bool,  n: bool,  o: bool,  p: bool,  q: bool,  r: bool } },A9: { A: {  a: bool,b: bool,c: string }, B: {  a: int,b: int,c: int,d: int,e: int,f: int,g: int },C: {  a: bool,b: bool,c: bool,d: bool },D: {  a: bool,b: bool,c: bool,d: bool,e: bool,  f: bool,  g: bool,  h: bool,  i: bool,  j: bool,  k: bool,  l: bool,  m: bool,  n: bool,  o: bool,  p: bool,  q: bool,  r: bool },ab: bool,bb: bool,cb: bool,db: bool,eb: bool,E: {  a: bool,b: bool,c: string },F: {  a: bool,b: bool,c: string,d: string } },A10: {  A: {  a: bool,b: bool,c: bool,d: bool,e: bool,  f: bool,  g: bool,  h: bool,  i: bool,  j: bool },B: string,C: {  a: bool,b: bool,b_e: string,c: bool,c_e: string,d: bool,e: bool,e_e: string } },A11: {  A: {  a: bool,b: bool,c: bool,d: string,e: bool,f: bool,g: bool,  h: bool,  i: bool,j: string,k: bool,l: bool,m: bool,n: string,o: bool,p: bool,q: bool,r: bool,s: bool,t: bool,u: bool,v: bool,w: bool,x: string },B: {  a: bool,b: bool,c: bool,d: bool } },A12: {a: bool,b: bool,c: string },A13: {a: bool,b: bool,c: string },A14: { approval_date: date }}
forms[:B] = {B1: string, B2: string,B3: { A: string, B: string, C: string},B4: string, B5: string, B6: string, B7: string, B8: string, B9: {yes: bool, content: string}} 
forms[:C] = {Nursing: bool, Units_Signatures:{ InpatientUnits:{Content: string, Signature: string},OutpatientUnits:{Content: string, Signature: string}}} 
forms[:E] = {E1:{ Investigational: bool,ind_num: string, Fda_restrict: bool,Fda_restrict_explanation: string}, Approval_status: {marketed: bool,fda_approved: bool,marketed_not_fda: {MNF1: bool,MNF2: bool,MNF3: bool,MNF4: bool,MNF5: bool},fda_not_marketed: {FNM_ind: string,FNM_assigned: string,FNM_CITI: string },authorized: string},E2: {generic_name: string,trade_name: string,manufacturer: string,primary_actions: string,how_specified: string,route_of_admin: string,carriers_preservatives: string,special_handling: string,therapeutic_use: string,dose: string,side_effects: string,antidotes: string,appended_material: {brochure: bool,pharmacology: bool,toxicology: bool,experience: bool,protocol: bool}},E3: {sponser_provides: bool,charged_pi: bool,charged_patient: bool},E4: {dispensed_pharmacy: bool,where_dispensed: string,investigator_supply: bool,prescribers: string,east_campus: bool,west_campus: bool,authorized_to_adminitrate: string},E5: {room_temp: bool,refrigeration: bool,freezer_warm: bool,freezer_cold: bool,other: string},E6: {special_equipment: bool,equipment_list: string},E7: {oral: bool,topical: bool,chemo: bool,non_chemo: bool,live_biologic: bool,other: string},E8: {received_for_review: string,date_approved: date}}
forms[:F] = {F1: {diagnostic_xray: bool,diagnostic_radioactive: bool,therapeutic_radiation: bool,therapeutic_radioactive: bool},F2: {xray_exposure: bool,nuclear_medicine: bool,radioisotope: bool,physician_name: string,isotope: string,chemical_form: string,dose: string,mode: string},F3: {received: bool,approved: bool,approval_date: date,not_need_review: bool}}
forms[:G] = {G1: {authorized_users: string,device_name_full: string,device_manfufacturer: string,sponsor: string,device_type: string},G2:  {marketed_aproved: bool,marketed_not_approved: bool,not_marketed_not_FDA: bool,exempt:{legally_marketed: bool,label_complies: bool,preference_testing: bool,early_distrobution: bool,substantially_equivilent: bool,custom_device: bool},no_risk_device:{explanation: string,no_banned: bool,cfr: bool,IRB_approval: bool,informed_consent: bool,monitoring_investigations: bool,records: bool,no_promotion: bool},high_risk: {cat_a: bool,cat_b: bool,IDE_num: string,company: string,CITI_GCP: {yes: bool,no: bool,NA: bool},interval: bool,restrictions: bool,explain_yes: string}},G3: {CDE_safe:{yes: bool,no: bool,NA: bool}},G4: {location: string,dispensing: string},G5: {cost: string,who_paying: string},G6:{IDE_attachment: bool,no_risk_attachment: bool,device_brochure: bool}}
forms[:J] = {J1: {infectious_agent:bool,xenotransplantation: bool,non_human_materials: bool},J2: {approved: {yes_when: date},non_aproved: {agent_name: string,airbourne: bool,enteric: bool,percutaneous: bool,skin: bool,BIDMC_pharmacy: bool,pharm_company: bool ,other:string,transport_vehicle: string,injection: bool,topical: bool,intravenous: bool,ingestion: bool ,impatient: bool,outpatient: bool,disposal: string,agent_subcept: string,no_percautions:bool,standard: bool,contact: bool ,respiratory: bool}},J3: {under_review: bool,approved: bool,no_review: bool},comments: string}
forms[:K] = {K1:{pop_based: bool,bio_sample: bool,pedigree: bool,pharmaco: bool, other: string, dna: bool,tissue: bool,protein: bool,rna: bool,cell_lines: bool,store_length: string,somatic_therapy: bool,minor_or_pregnant: bool},K2:{location_bidmc: bool},K3:{research_diclose: {  patient: bool,primary: bool,relatives:bool},third_party: bool,    commerce: bool,commerce_sample: bool}}
forms[:L] = {L1:{hazardous_agents: string},L2:{coms_approved: bool,no_coms_submitted: bool,coms_submitted:{date: date,num_pend: int},comments: string}}
forms[:M] = {do_q1: bool,do_q2: bool,do_q3: bool,do_q4: bool,do_q5: bool,do_q6: bool,do_q7: bool,q_1_a: bool,q_1_b: bool,q_2_a: bool,q_2_b: bool,q_3_a: bool,q_4_a: bool,q_4_b: bool,q_4_c: bool,q_5_a: bool,q_5_b: bool,q_5_c: bool,q_5_d: bool,q_6_a: bool,q_6_b: bool,q_6_c: bool,q_7_a: bool,q_7_b: bool}
forms[:N] = {sample_type: string,sample_size: string,no_more_sample: bool,more_sample: string,no_disease_samples: bool,how_many_samples: string,specimen_time: {start_d: date,end_d: date},sample_sources: {bidmc_path: bool,repository: bool,other: string},study_duration: string,no_identifiers: bool,identifiers: {contact_pats: bool,if_yes_exp: string},human_discard: string,sample_profit: bool,if_profit_exp: string,data_use: {publicc: bool,present: bool,other: string},related_research:bool}
forms[:O] =  {name_pi: string,name_ci: string,mail_address: string,email_address: string,pi_phoneNumber: string,pi_pagerNumber: string,pi_Fax: string,fund_Source: string,MRI: {patient_Info: string,psych_records: bool,record_amount: int,timePeriod_F: int,timePeriod_T: int,sourceInfo: bool,studyTime: int,identifiers: bool,contactPatients: bool,why_cP: string,confidentiality: string,patient_IndInfo: bool,data_results: bool,form_relate_N: bool}}
forms[:P] = {minimal_risk: bool,signature: string,moderate_risk: bool,MDSP: {monitoring: bool,analysis: bool,additional: string,signature: string,},high:{high_risk: bool,DSMP_requirement: string,describe_DSMP: string,signature: string,}}
forms[:Q] = {information: {name: string,institution: string,dept: string,division: string,physician: bool,co_investigator: bool,research_coordinator: bool,non_staff: bool,data_coordinator: bool,research_nurse: bool,other: bool,mailing_address: string,e_mail: string,telephone: string,pager: string,fax: string},certification: {reviewed: bool,CITI: bool,written_doc: bool,confidential: bool,responsibility: bool},conflict_interest: {paid: bool,if_yes:{consulting: bool,management: bool,other: bool,board_member: bool,scientific_board: bool,stock: bool,royalties: bool,intellectual: bool,author: bool,gifts: bool,loans: bool}},paid: bool,BIDMC_want: bool,signature: string,date: string}
forms[:W] = {rsi: {pi_name: string,pi_depart: string,mail_address: string,email_address: string,pi_phone: string,pi_pager: string,pi_fax: string,ci_info: {ci_name: string,},dci: {data_guy: string,mail_address: string,email_address: string,dg_phonen: string,dg_pager: string,dg_fax: string} },woa_rationale: {recruitment: bool,verbal_consent: bool,request_w: bool,other: string},uophi: {list_persons_name: string,persons_purpose: string,persons_ident: bool,geo_sub: bool,elements_date: bool,ff_images: bool,unique_ident: bool,unique_ident_e: string,study_access: string,noaccess_phi: bool,noaccess_phi_e: string},dphi: {list_persons_name: string,persons_purpose: string,persons_ident: bool,geo_sub: bool,elements_date: bool,ff_images: bool,unique_ident: bool,unique_ident_e: string,info_disclosed: string},pdphi: {protect_phi: string,destroy_phi: string },pis: {certify_phi: bool,pi_sig: string,pi_date: int,pi_printname: string}}
forms[:S] = {full_board: bool,expedited_review: bool,exempt_review: bool,title: string,pi: {pi: string,department: string,division: string,expertise: bool,suggestions: string,additional: bool,suggestions: string},materials: {CCI_application: bool,sponsor: bool,brochure: bool,grant: bool,informed: bool,other: bool,specify: string,},merit: {adequate: bool,risk: bool,risk_reduced: bool,risks_described: bool,study_design: bool,sample_size: bool,outcome_measure: bool,statistical_plan: bool,pre_clinical: bool,human_subjects: bool,meet_goals: bool,comments: string},D_SMP: {determined_risk: bool,no_whatisrisk: string,plan_appropriate: bool,suggestions: string},revisions: {can_submit: bool,requires_revisions: bool,date: string,reviewed: bool,date: string},print_name: string,date: string,signature: string}


def build_edit hash, path, f, whitespace, form='f'
  hash.each do |key, val|
    f.puts "#{whitespace}<div class=field>#{key}<br />"
    w = whitespace + '  '
    case val
    when Date
      f.puts "#{w}<%= #{form}.date_select :#{key}, value: (@contents#{path}[:#{key}] rescue nil) %>"
    when Fixnum
      f.puts "#{w}<%= #{form}.number_field :#{key}, value: (@contents#{path}[:#{key}] rescue nil) %>"
    when TrueClass
      f.puts "#{w}<%= #{form}.check_box :#{key}, checked: (@contents#{path}[:#{key}]=='1' rescue false) %>"
    when String
      f.puts "#{w}<%= #{form}.text_field :#{key}, value: (@contents#{path}[:#{key}] rescue nil) %>"
    when Hash
      f.puts "#{w}<%= #{form}.fields_for :#{key} do |f#{key}|%>"
      build_edit val, "#{path}[:#{key}]", f, w+'  ', "f#{key}"
      f.puts "#{w}<% end %>"
    when Array
      f.puts "#{w}<%= #{form}.fields_for :#{key} do |f#{key}|%>"
      build_edit val, "#{path}[:#{key}]", f, w+'  ', "f#{key}"
      f.puts "#{w}<% end %>"
    end
    f.puts "#{whitespace}</div>"
  end
end

def build_show hash, path, f, whitespace
  hash.each do |key, val|
    case val
    when Date
      f.puts "#{whitespace}<b>#{key}:</b>"
      f.puts "<%= @contents#{path}[:#{key}] rescue '' %><br />"
    when Fixnum
      f.puts "#{whitespace}<b>#{key}:</b>"
      f.puts "<%= @contents#{path}[:#{key}] rescue '' %><br />"
    when TrueClass
      f.puts "#{whitespace}<b>#{key}:</b>"
      f.puts "<%= check_box_tag 'b', 'b', ((@contents#{path}[:#{key}] rescue 0)=='0' ? false : 1), disabled:true %><br />"
    when String
      f.puts "#{whitespace}<b>#{key}:</b>"
      f.puts "<%= @contents#{path}[:#{key}] rescue '' %><br />"
    when Hash
      f.puts "#{whitespace}<b>#{key}:</b><br />"
      build_show val, path+"[:#{key}]", f, whitespace+'&nbsp;&nbsp;'
    when Array
      f.puts "#{whitespace}<b>#{key}:</b><br />"
      build_show val, path+"[:#{key}]", f, whitespace+'&nbsp;&nbsp;'
    end
  end
end

if ARGV.include? 'edit'
  puts 'forms/_form.html.erb being generated'
  File.open('app/views/forms/_form.html.erb', 'w+') do |f|
    forms.each do |key, val|
      f.puts "<% if @form.part == '#{key}' %>"
      f.puts "  <%= form_for :content, url: {action: 'update'}, method: 'PUT' do |f|%>"
      f.puts "    <%= submit_tag 'Save' %>"
      build_edit val, '', f, '    '
      f.puts "    <%= submit_tag 'Save' %>"
      f.puts "  <% end %>"
      f.puts "<% end %>"
    end
  end
  puts 'sucess!'
end
if ARGV.include? 'show'
  puts 'forms/show.html.erb being generated'
  File.open('app/views/forms/show.html.erb', 'w+') do |f|
    f.puts "<%= link_to 'Edit', edit_form_path(@form) %> |
<%= link_to 'Back', :back %>"
    forms.each do |key, val|
      f.puts "<% if @form.part == '#{key}' %>"
      f.puts "  <p id='notice'><%= notice %></p>"
      build_show val, '', f, '&nbsp;&nbsp;'
      f.puts "<% end %>"
    end
    f.puts "<%= link_to 'Edit', edit_form_path(@form) %> |
<%= link_to 'Back',  %>"
  end
  puts 'sucess!'
end