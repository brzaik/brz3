class AddShowTitleFlagToSections < ActiveRecord::Migration
  def change
    add_column :sections, :show_title_as_header, :boolean, :default => true, :null => false
  end
end
