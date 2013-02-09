class AddTitleToOrbits < ActiveRecord::Migration
  def change
    add_column :orbits, :title, :string
  end
end
