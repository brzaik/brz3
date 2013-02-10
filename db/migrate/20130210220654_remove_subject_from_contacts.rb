class RemoveSubjectFromContacts < ActiveRecord::Migration
  def up
    remove_column :contacts, :subject
  end

  def down
    add_column :contacts, :subject, :string
  end
end
