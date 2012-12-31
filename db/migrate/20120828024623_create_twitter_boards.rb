class CreateTwitterBoards < ActiveRecord::Migration
  def change
    create_table :twitter_boards do |t|
      t.string :account_name
      t.integer :display_num
      t.integer :block_id

      t.timestamps
    end
  end
end
