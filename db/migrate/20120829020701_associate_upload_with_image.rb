class AssociateUploadWithImage < ActiveRecord::Migration
  def up
    add_column :images, :upload_id, :integer
  end

  def down
    remove_column :images, :upload_id
  end
end
