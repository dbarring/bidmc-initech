class Form < ActiveRecord::Base
  attr_accessible :cci_notes, :content, :editor_id, :irb_note, :part, :revision_child_id

  def current_version #returns the current version of the form

  end

  def version_history #returns a list of all previous versions of the form

  end

  def complete? #returns boolean representing whether the form is complete to a level of submission

  end

  def status #returns the status of the form

  end

  def buld_current_version #used by current_version

  end
end
