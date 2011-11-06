class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.integer :user_id, null: false
      t.integer :ad_id, null: false

      t.timestamps
    end

    add_index :replies, :user_id
    add_index :replies, :ad_id
  end
end
