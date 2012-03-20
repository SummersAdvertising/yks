class Allstatus < ActiveRecord::Migration
  def change
  	add_column :defines, :status, :binary
    	add_column :user_exps, :status, :binary
  end
end
