class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :content_name
      t.integer :position
      t.integer :section_id
      t.string :additional_styles
      t.string :additional_tags

      t.timestamps
    end
  end
end
