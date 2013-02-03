class AddPrivateFlagToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_private, :boolean, :null => false, :default => true
  end
end
