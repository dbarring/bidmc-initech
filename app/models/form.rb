class Form < ActiveRecord::Base
  attr_accessible :cci_notes, :content, :editor_id, :irb_note, :part, :revision_child_id
end
