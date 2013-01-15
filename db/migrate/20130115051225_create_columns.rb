class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.integer :row_id
      t.integer :position
      t.integer :span_width
      t.string :additional_styles
      t.string :additional_tags

      t.timestamps
    end
  end
end
