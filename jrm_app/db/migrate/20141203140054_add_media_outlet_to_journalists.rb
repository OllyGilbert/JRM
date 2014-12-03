class AddMediaOutletToJournalists < ActiveRecord::Migration
  def change
    add_column :journalists, :media_outlet, :string
  end
end
