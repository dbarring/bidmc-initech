class UserGroupRenameTypeToGroupType < ActiveRecord::Migration
  def up
    rename_column :user_groups, :type, :group_type
  end

  def down
  end
end
