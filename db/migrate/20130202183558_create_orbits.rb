class CreateOrbits < ActiveRecord::Migration
  def change
    create_table :orbits do |t|
      t.integer :block_id

      t.timestamps
    end
  end
end
