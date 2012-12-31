class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :page_id
      t.integer :position
      t.string :additional_styles
      t.string :additional_tags
      
      t.timestamps
    end
  end
end
