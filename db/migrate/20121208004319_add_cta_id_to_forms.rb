class AddCtaIdToForms < ActiveRecord::Migration
  def change
  	add_column :forms, :cta_id, :int
  end
end
