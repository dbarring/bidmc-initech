class Form < ActiveRecord::Base
  attr_accessible :cci_notes, :content, :editor_id, :irb_note, :part, :revision_child_id

  before_save :format_content

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

  def hash_contents
    return YAML.load(self.content)
  end

  def format_content
    self.format_content if new_record?
    self.content = self.content.to_yaml if self.content.class == Hash
  end

  def default_content
    case self.type
    when "A"
      self.content = {full_board: nil, expedited: nil, a1: {title: nil, short_title: nil}, a2: {pi_id: nil, ci_ids:[], main_content: nil}, a3: {type: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, p_e:nil}, design: {a:nil, b:nil, c:nil}, phase: {1:nil, 12:nil, 2:nil, 23:nil, 3:nil, 4:nil, other:nil, other_e:nil}, placebo: nil}, a4: { a: { ab: nil, ad:nil, bb:nil}, b: {ab:nil, as:nil, bs:nil, bb:nil, cb:nil}, c: { 1: { conflict:nil, consulting:nil, management:nil, employement:nil, board_directors:nil, scientific_board:nil, stock:nil, royalties:nil, ip_rights:nil, author:nil, gift:nil, loan:nil, other:nil, other_explained:nil}, 2: nil, 3: {b:nil, s:nil}}}, a5: { nurse:nil, drugs:nil, xray:nil, investigation:nil, lab:nil, transfustion:nil, radio:nil, clinical:nil, infectious:nil, genetic:nil, hazardous:nil, expedited:nil, records:nil, tissue:nil, other:nil}, a6: { from:nil, to:nil}, a7: { a: {others:nil, num:nil}, b: {lead:nil, institutions:[{site:nil, irb:nil, permission:nil, irb_contact:nil, irb_approval:nil}, {site:nil, irb:nil, permission:nil, irb_contact:nil, irb_approval:nil}, {site:nil, irb:nil, permission:nil, irb_contact:nil, irb_approval:nil}]}}, a8: {no_funding:nil, reason:nil, yes_funding:nil, industry:nil, federal:nil, foundation:nil, internal:nil, free:nil, a: {industry:nil, industry_entity:nil, investigator_external:nil, investigator_external_entity:nil, investigator_internal:nil, investigator_internal_entity:nil}, b: {office_name:nil, office_date:nil, ra_name:nil, ra_date:nil}, c: {review:nil, approved:nil, supported:nil, other:nil, reason:nil}, d: {dollars:nil, non_monetary:nil, one_site:nil, multi_site:nil, fed_grant_yes:nil, fed_grant_no:nil, institution:nil, defense:nil}, e: {b_y:nil, b_n:nil, s:nil}, f: {grant:nil, g_date:nil, funded:nil, pending:nil}, g: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, q:nil, r:nil}}, a9: { a: {a:nil, b:nil, c:nil}, b: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil}, c: {a:nil, b:nil, c:nil, d:nil}, d: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, q:nil, r:nil}, ab:nil, bb:nil, cb:nil, db:nil, eb:nil, e: {a:nil, b:nil, c:nil}, f: {a:nil, b:nil, c:nil, d:nil}}, a10: {a: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil}, b:nil, c: {a:nil, b:nil, b_e:nil, c:nil, c_e:nil, d:nil, e:nil, e_e:nil}}, a11: {a: {a:nil, b:nil, c:nil, d:nil, e:nil, f:nil, g:nil, h:nil, i:nil, j:nil, k:nil, l:nil, m:nil, n:nil, o:nil, p:nil, q:nil, r:nil, s:nil, t:nil, u:nil, v:nil, w:nil, x:nil}, b: {a:nil, b:nil, c:nil, d:nil}}, a12: {a:nil, b:nil, c:nil}, a13: {a:nil, b:nil, c:nil}, a14: {approval_date:nil}}
    when "B"

    when "C"

    when "D"

    when "E"

    when "F"

    when "G"

    when "H"

    when "J"

    when "K"

    when "L"

    when "M"

    when "N"

    when "O"

    when "P"

    when "Q"

    when "S"

    when "W"

    end
  end
end
