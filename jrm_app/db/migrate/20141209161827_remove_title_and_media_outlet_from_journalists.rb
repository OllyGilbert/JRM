class RemoveTitleAndMediaOutletFromJournalists < ActiveRecord::Migration
  def up
    remove_column :journalists, :title
    remove_column :journalists, :media_outlet
  end

  def down
    add_column :journalists, :media_outlet, :string
    add_column :journalists, :title, :string
  end
end
