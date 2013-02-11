class AddUrlToPages < ActiveRecord::Migration
  def change
    add_column :pages, :url_link, :string
  end
end
