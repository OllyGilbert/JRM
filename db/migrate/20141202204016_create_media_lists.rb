class CreateMediaLists < ActiveRecord::Migration
  def change
    create_table :media_lists do |t|
      t.string :name
      t.integer :user_id
      t.integer :journalist_ids

      t.timestamps
    end
  end
end
