class Changeticketstatus < ActiveRecord::Migration
  def change
    change_column :tickets, :status, :int
    rename_column :tickets, :status, :define_id
  end
end
