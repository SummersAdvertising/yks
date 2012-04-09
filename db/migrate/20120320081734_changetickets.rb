class Changetickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :content, :remark
    rename_column :tickets, :title, :name
    add_column :tickets, :phone, :string
    add_column :tickets, :address, :string
    add_column :tickets, :email, :string
    add_column :tickets, :hopetime, :integer
  end
end
