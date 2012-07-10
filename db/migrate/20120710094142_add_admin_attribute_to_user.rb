class AddAdminAttributeToUser < ActiveRecord::Migration
  def change
  	add_column :defines, :special_define, :bool
  end
end
