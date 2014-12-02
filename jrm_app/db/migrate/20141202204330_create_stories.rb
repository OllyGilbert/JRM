class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :headline
      t.text :summary
      t.date :date_published
      t.string :journalist_id

      t.timestamps
    end
  end
end
