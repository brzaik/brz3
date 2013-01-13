class AddPagesTagsTable < ActiveRecord::Migration
  def up
    create_table :pages_tags, :id => false do |t|
      t.references :page, :tag
    end
  end

  def down
    drop_table :pages_tags
  end
end