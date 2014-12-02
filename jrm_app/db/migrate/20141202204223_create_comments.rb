class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :story_id
      t.string :user_id

      t.timestamps
    end
  end
end
