class CreateCtas < ActiveRecord::Migration
  def change
    create_table :ctas do |t|
      t.integer :pi_id
      t.integer :workflow_status

      t.timestamps
    end
  end
end
