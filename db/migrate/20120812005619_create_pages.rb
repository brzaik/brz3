class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.boolean :is_highlight
      t.integer :template_id
      t.string :slug
      t.string :meta_description

      t.timestamps
    end
  end
end
