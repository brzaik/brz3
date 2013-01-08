class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.integer :linkable_id
      t.string :linkable_type
      t.string :caption

      t.timestamps
    end
  end
end
