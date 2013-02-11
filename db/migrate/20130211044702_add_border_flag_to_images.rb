class AddBorderFlagToImages < ActiveRecord::Migration
  def change
    add_column :images, :include_border, :boolean, :null => false, :default => true
  end
end
