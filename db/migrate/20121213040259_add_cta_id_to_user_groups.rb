class AddCtaIdToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :cta_id, :integer
  end
end
