class AddViewAsAdminFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :view_as_admin, :boolean, :default => true
  end
end
