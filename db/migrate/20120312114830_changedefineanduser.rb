class Changedefineanduser < ActiveRecord::Migration
  def change
      change_column :users, :usertype, :integer
    rename_column(:users, :usertype, :define_id)
      #drop_table(:events)
  end
end
