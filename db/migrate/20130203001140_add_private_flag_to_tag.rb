class AddPrivateFlagToTag < ActiveRecord::Migration
  def change
    add_column :tags, :is_private, :boolean, :null => false, :default => false
    add_column :tags, :access_group_name, :string
  end
end
