class AddTwitterToJournalists < ActiveRecord::Migration
  def change
    add_column :journalists, :twitter, :string
  end
end
