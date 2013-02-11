class RemoveMetaDescriptionFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :meta_description
  end

  def down
    add_column :pages, :meta_description, :string
  end
end
