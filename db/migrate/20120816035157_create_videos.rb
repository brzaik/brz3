class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.integer :videoable_id
      t.string :videoable_type

      t.timestamps
    end
  end
end
