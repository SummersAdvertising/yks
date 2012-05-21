class AddSortKeyToDefines < ActiveRecord::Migration
  def change
  	add_column :defines, :sort, :integer
  end
end
