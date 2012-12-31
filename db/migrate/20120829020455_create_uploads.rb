class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.has_attached_file :myfile

      t.timestamps
    end
  end
end
