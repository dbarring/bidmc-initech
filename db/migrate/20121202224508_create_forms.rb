class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :part
      t.text :content
      t.text :cci_notes
      t.text :irb_note
      t.integer :revision_child_id
      t.integer :editor_id

      t.timestamps
    end
  end
end
