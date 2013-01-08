class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.text :quote
      t.string :concatenated_quote
      t.integer :quoteable_id
      t.string :quoteable_type

      t.timestamps
    end
  end
end
