class CreateRichtexts < ActiveRecord::Migration
  def change
    create_table :richtexts do |t|
      t.integer :block_id
      t.text :content

      t.timestamps
    end
  end
end
