require "Date"

bool = true
int = 1
string = 'a'
date = Date.new

v = {full_board: bool, expedited: bool, A1: {title: string, short_title: string}, A2: {  pi_id: int, ci_ids: [int], main_contact_id: int }, A3: {  type: { a: bool, b: bool, c: bool, d: bool, e: bool, f: bool, g: bool, h: bool, i: bool, j: bool, k: bool, l: bool, m: bool, n: bool, o: bool, p: bool, p_e: string }, design: { a: bool,b: bool,c: bool }, phase: {  i: bool,i_ii: bool,ii: bool,ii_iii: bool,iii: bool,iiii: bool,other: bool,other_e: string }, placebo: bool },A4: { A: {  ab: bool,ad: date,bb: bool},B: {  ab: bool,as: string,bs: string,bb: bool,cb: bool },C: {  a1: { conflict: bool,consulting: bool,management: bool,employment: bool,board_directors: bool,scientific_board: bool,stock: bool,royalties: bool,ip_rights: bool,author: bool,gift: bool,loan: bool,other: bool,other_explained: string },a2: bool,a3: { b: bool,s: string } }},A5: { nurse: bool,drugs: bool,xray: bool,investigation: bool,lab: bool,transfusion: bool,radio: bool,clinical: bool,infectious: bool,genetic: bool,hazardous: bool,expedited: bool,records: bool,tissue: bool,other: bool},A6: {   from: date,to: date },A7: { A: {  others: bool,num: int },B: {  lead: bool,institutions: [ { site: string,irb: bool,permission: bool,irb_contact: string,irb_approval: bool } ] } }, A8: { no_funding: bool,reason: string,yes_funding: bool,industry: bool,federal: bool,foundation: bool,internal: bool,free: bool,A: {  industry: bool,industry_entity: string,investigator_external: bool,investigator_external_entity: string,investigator_internal: bool,investigator_internal_entity: string },B: {  office_name: string,office_date: date,ra_name: string,ra_date: date },C: {  review: bool,approved: bool,supported: bool,other: bool,reason: string },D: {  dollars: string,non_monetary: string,one_site: bool,multi_site: bool,fed_grant_yes: bool,fed_grant_no: bool,institution: string,defense: bool },E: {  b_y: bool,b_n: bool,s: string },F: {  grant: int,g_date: date,funded: bool,pending: bool },G: {  a: bool,b: bool,c: bool,d: bool,e: bool,  f: bool,  g: bool,  h: bool,  i: bool,  j: bool,  k: bool,  l: bool,  m: bool,  n: bool,  o: bool,  p: bool,  q: bool,  r: bool } },A9: { A: {  a: bool,b: bool,c: string }, B: {  a: int,b: int,c: int,d: int,e: int,f: int,g: int },C: {  a: bool,b: bool,c: bool,d: bool },D: {  a: bool,b: bool,c: bool,d: bool,e: bool,  f: bool,  g: bool,  h: bool,  i: bool,  j: bool,  k: bool,  l: bool,  m: bool,  n: bool,  o: bool,  p: bool,  q: bool,  r: bool },ab: bool,bb: bool,cb: bool,db: bool,eb: bool,E: {  a: bool,b: bool,c: string },F: {  a: bool,b: bool,c: string,d: string } },A10: {  A: {  a: bool,b: bool,c: bool,d: bool,e: bool,  f: bool,  g: bool,  h: bool,  i: bool,  j: bool },B: string,C: {  a: bool,b: bool,b_e: string,c: bool,c_e: string,d: bool,e: bool,e_e: string } },A11: {  A: {  a: bool,b: bool,c: bool,d: string,e: bool,f: bool,g: bool,  h: bool,  i: bool,j: string,k: bool,l: bool,m: bool,n: string,o: bool,p: bool,q: bool,r: bool,s: bool,t: bool,u: bool,v: bool,w: bool,x: string },B: {  a: bool,b: bool,c: bool,d: bool } },A12: {a: bool,b: bool,c: string },A13: {a: bool,b: bool,c: string },A14: { approval_date: date }}


def fuck_shit hash, path, f
  hash.each do |ke, val|
    key = path + '__' + ke.to_s
    f.puts "<div class=field>#{key}<br />"
    case val
    when Date
      f.puts "<%= date_select :#{key}, '' %>"
    when Fixnum
      f.puts "<%= number_field_tag :#{key} %>"
    when TrueClass
      f.puts "<%= check_box_tag :#{key} %>"
    when String
      f.puts "<%= text_field_tag :#{key} %>"
    when Hash
      fuck_shit val, key, f
    end
    f.puts "</div>"
  end
end


File.open('test_view.html', 'w+') do |f|
  f.puts "<% form_for 'forms/save' do %>"
  fuck_shit v, '', f
  f.puts "<%= submit_tag 'Save' %>"
  f.puts "<% end %>"
end


