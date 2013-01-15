class ChangeSectionIdInBlocks < ActiveRecord::Migration
  def up
    rename_column :blocks, :section_id, :column_id
  end

  def down
    rename_column :blocks, :column_id, :section_id
  end
end
