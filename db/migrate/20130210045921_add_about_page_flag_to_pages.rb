class AddAboutPageFlagToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_about_page, :boolean, :null => false, :default => false
  end
end
