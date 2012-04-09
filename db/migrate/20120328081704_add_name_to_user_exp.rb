class AddNameToUserExp < ActiveRecord::Migration
	def change
		add_column :user_exps, :name, :string	
	end
end
