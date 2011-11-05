class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :company
      t.string :description
      t.integer :user_id, null: false

      t.timestamps
    end

  end
end
