class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.integer :publisher_id
      t.integer :journalist_id

      t.timestamps
    end
  end
end
