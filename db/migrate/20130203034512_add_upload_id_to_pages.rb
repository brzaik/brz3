class AddUploadIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :upload_id, :integer
  end
end
