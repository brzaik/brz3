class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.integer :section_id
      t.integer :position
      t.string :additional_styles
      t.string :additional_tags

      t.timestamps
    end
  end
end
