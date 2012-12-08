class Form < ActiveRecord::Base
  attr_accessible :cci_notes, :content, :editor_id, :irb_note, :part, :revision_child_id, :cta_id

  before_save :format_content

  belongs_to :cta

  def current_version #returns the current version of the form
    return 
  end

  def version_history #returns a list of all previous versions of the form

  end

  def complete? #returns boolean representing whether the form is complete to a level of submission

  end

  def status #returns the status of the form

  end

  def build_current_version #used by current_version

  end

  def hash_content
    return YAML.load(self.content)
  end

  def format_content
    self.default_content if new_record?
    self.content = self.content.to_yaml if self.content.class == Hash
  end

  def default_content
    case self.part
    when "A"
      self.content = {full_board: nil, expedited: nil, a1: {title: nil, short_title: nil}, a2: {pi_id: nil, ci_ids:[], main_content: nil}, a3: {type: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, p_e:nil}, design: {a:nil, b:nil, c:nil}, phase: {i:nil, i_ii:nil, ii:nil, ii_iii:nil, iii:nil, iiii:nil, other:nil, other_e:nil}, placebo: nil}, a4: { a: { ab: nil, ad:nil, bb:nil}, b: {ab:nil, as:nil, bs:nil, bb:nil, cb:nil}, c: { a1: { conflict:nil, consulting:nil, management:nil, employement:nil, board_directors:nil, scientific_board:nil, stock:nil, royalties:nil, ip_rights:nil, author:nil, gift:nil, loan:nil, other:nil, other_explained:nil}, a2: nil, a3: {b:nil, s:nil}}}, a5: { nurse:nil, drugs:nil, xray:nil, investigation:nil, lab:nil, transfustion:nil, radio:nil, clinical:nil, infectious:nil, genetic:nil, hazardous:nil, expedited:nil, records:nil, tissue:nil, other:nil}, a6: { from:nil, to:nil}, a7: { a: {others:nil, num:nil}, b: {lead:nil, institutions:[{site:nil, irb:nil, permission:nil, irb_contact:nil, irb_approval:nil}, {site:nil, irb:nil, permission:nil, irb_contact:nil, irb_approval:nil}, {site:nil, irb:nil, permission:nil, irb_contact:nil, irb_approval:nil}]}}, a8: {no_funding:nil, reason:nil, yes_funding:nil, industry:nil, federal:nil, foundation:nil, internal:nil, free:nil, a: {industry:nil, industry_entity:nil, investigator_external:nil, investigator_external_entity:nil, investigator_internal:nil, investigator_internal_entity:nil}, b: {office_name:nil, office_date:nil, ra_name:nil, ra_date:nil}, c: {review:nil, approved:nil, supported:nil, other:nil, reason:nil}, d: {dollars:nil, non_monetary:nil, one_site:nil, multi_site:nil, fed_grant_yes:nil, fed_grant_no:nil, institution:nil, defense:nil}, e: {b_y:nil, b_n:nil, s:nil}, f: {grant:nil, g_date:nil, funded:nil, pending:nil}, g: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, q:nil, r:nil}}, a9: { a: {a:nil, b:nil, c:nil}, b: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil}, c: {a:nil, b:nil, c:nil, d:nil}, d: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, q:nil, r:nil}, ab:nil, bb:nil, cb:nil, db:nil, eb:nil, e: {a:nil, b:nil, c:nil}, f: {a:nil, b:nil, c:nil, d:nil}}, a10: {a: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil}, b:nil, c: {a:nil, b:nil, b_e:nil, c:nil, c_e:nil, d:nil, e:nil, e_e:nil}}, a11: {a: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, q:nil, r:nil, s:nil, t:nil, u:nil, v:nil, w:nil, x:nil}, b: {a:nil, b:nil, c:nil, d:nil}}, a12: {a:nil, b:nil, c:nil}, a13: {a:nil, b:nil, c:nil}, a14: {approval_date:nil}}
    when "B"
      self.content = {b1:nil, b2:nil,b3: { a:nil, b:nil, c:nil},b4:nil, b5:nil, b6:nil, b7:nil, b8:nil, b9: {yes:nil, content:nil}}
    when "C"
      self.content = {nursing:nil, units_Signatures: { inpatient_units: {content:nil, signature:nil},outpatientunits: {content:nil, signature:nil}}}
    when "E"
      self.content = {e1:{ investigational:nil, ind_num:nil, fda_restrict:nil,fda_restrict_explanation:nil}, approval_status: {marketed:nil,fda_approved:nil,marketed_not_fda: {fnm1:nil,fnm2:nil,fnm3:nil,fnm4:nil,fnm5:nil},fda_not_marketed: {fnm_ind:nil,fnm_assigned:nil,fnm_citi:nil },authorized:nil},e2: {generic_name:nil,trade_name:nil,manufacturer:nil,primary_actions:nil,how_specified:nil,route_of_admin:nil,carriers_preservatives:nil,special_handling:nil,therapeutic_use:nil,dose:nil,side_effects:nil,antidotes:nil,appended_material: {brochure:nil,pharmacology:nil,toxicology:nil,experience:nil,protocol:nil},},e3: {sponser_provides:nil,charged_pi:nil,charged_patient:nil},e4: {dispensed_pharmacy:nil,where_dispensed:nil,investigator_supply:nil,prescribers:nil,east_campus:nil,west_campus:nil,authorized_to_adminitrate:nil},e5: {room_temp:nil,refrigeration:nil,freezer_warm:nil,freezer_cold:nil,other:nil},e6: {special_equipment:nil,equipment_list:nil},e7: {oral:nil,topical:nil,chemo:nil,non_chemo:nil,live_biologic:nil,other:nil},e8: {received_for_review:nil,date_approved:nil}}
    when "F"
      self.content = {f1: {diagnostic_xray:nil,diagnostic_radioactive:nil,therapeutic_radiation:nil,therapeutic_radioactive:nil,},f2: {xray_exposure:nil,nuclear_medicine:nil,radioisotope:nil,physician_name:nil,isotope:nil,chemical_form:nil,dose:nil,mode:nil,},f3: {received:nil,approved:nil,approval_date:nil,not_need_review:nil}}
    when "G"
      self.content = {g1: {authorized_users:nil,device_name_full:nil,device_manufacturer:nil,sponsor:nil,device_type:nil},g2:  {marketed_aproved:nil,marketed_not_approved:nil,not_marketed_not_FDA:nil,exempt:{legally_marketed:nil,label_complies:nil,preference_testing:nil,early_distrobution:nil,substantially_equivilent:nil,custom_device:nil},no_risk_device:{explanation:nil,no_banned:nil,cfr:nil,irb_approval:nil,informed_consent:nil,monitoring_investigations:nil,records:nil,no_promotion:nil},high_risk: {cat_a:nil,cat_b:nil,ide_num:nil,company:nil,citi_gcp: {yes:nil,no:nil,na:nil},interval:nil,restrictions:nil,explain_yes:nil}},g3: {cde_safe:{yes:nil,no:nil,na:nil}},g4: {location:nil,dispensing:nil},g5: {cost:nil,who_paying:nil},g6:{ide_attachment:nil,no_risk_attachment:nil,device_brochure:nil}}
    when "J"
      self.content = {j1: {infectious_agent:nil,xeno_transplantation:nil,non_human_materials:nil},j2: {approved: {yes_when:nil},non_aproved: {agent_name:nil,airbourne:nil,enteric:nil,percutaneous:nil,skin:nil,bidmc_pharmacy:nil,pharm_company:nil ,other:nil,transport_vehicle:nil,injection:nil,topical:nil,intravenous:nil,ingestion:nil ,impatient:nil,outpatient:nil,disposal:nil,agent_subcept:nil,no_percautions:nil,standard:nil,contact:nil ,respiratory:nil}},j3: {under_review:nil,approved:nil,no_review:nil},comments:nil}
    when "K"
      self.content = {k1:{pop_based:nil,bio_sample:nil,pedigree:nil,pharmaco:nil, other:nil,dna:nil,tissue:nil,protein:nil,rna:nil,cell_lines:nil,store_length:nil,somatic_therapy:nil,minor_or_pregnant:nil}, k2:{location_bidmc:nil}, k3:{research_diclose: {  patient:nil,primary:nil,relatives:nil}, third_party:nil, commerce:nil,commerce_sample:nil}}
    when "L"
      self.content = {l1:{hazardous_agents:nil}, l2:{coms_approved:nil,no_coms_submitted:nil,coms_submitted:{date:nil,num_pend:nil}, comments:nil}}
    when "M"
      self.content = {do_q1:nil,do_q2:nil,do_q3:nil,do_q4:nil,do_q5:nil,do_q6:nil,do_q7:nil,  q_1_a:nil,q_1_b:nil,q_4_a:nil,q_4_b:nil,q_4_c:nil,q_5_a:nil,q_5_b:nil,q_5_c:nil,q_5_d:nil,    q_6_a:nil,q_6_b:nil,q_6_c:nil,q_7_a:nil,q_7_b:nil}
    when "N"
      self.content = {sample_type:nil,sample_size:nil,no_more_sample:nil,more_sample:nil,no_disease_samples:nil,how_many_samples:nil,specimen_time: {start:nil,end_date:nil}, sample_sources: {bidmc_path:nil,repository:nil,other:nil}, study_duration:nil,no_identifiers:nil,identifiers: {contact_pats:nil,if_yes_exp:nil}, human_discard:nil,sample_profit:nil,if_profit_exp:nil,data_use: {public_b:nil,present:nil,other:nil},related_research:nil}
    when "O"
      self.content = {name_pi:nil,name_ci:nil,mail_address:nil,email_address:nil,pi_phonenumber:nil,pi_pagernumber:nil,pi_Fax:nil,fund_source:nil,mri: {patient_info:nil,psych_records:nil,record_amount:nil,timePeriod_f:nil,timePeriod_t:nil,sourceInfo:nil,studyTime:nil,identifiers:nil,contactPatients:nil,why_cp:nil,confidentiality:nil,patient_IndInfo:nil,data_results:nil,form_relate_n:nil}}
    when "P"
      self.content = {minimal_risk:nil,signature:nil,moderate_risk:nil, mdsp: {monitoring:nil, analysis:nil, additional:nil, signature:nil}, high:{high_risk:nil, dsmp_requirement:nil, describe_dsmp:nil,signature:nil}}
    when "Q"
      self.content = {information: {name:nil,institution:nil,dept:nil,division:nil,physician:nil,co_investigator:nil,research_coordinator:nil,non_staff:nil,data_coordinator:nil,research_nurse:nil,other:nil,mailing_address:nil,e_mail:nil,telephone:nil,pager:nil,fax:nil},certification: {reviewed:nil,citi:nil,written_doc:nil,confidential:nil,responsibility:nil},conflict_interest: {paid:nil,if_yes:{consulting:nil,management:nil,other:nil,board_member:nil,scientific_board:nil,stock:nil,royalties:nil,intellectual:nil,author:nil,gifts:nil,loans:nil}},paid:nil, bidmc_want:nil,signature:nil,date:nil}
    end
  end
end