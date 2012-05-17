class AddFilePathAndExtensionToPhoto < ActiveRecord::Migration
  def change
  	add_column :photos, :file_path, :string
  	add_column :photos, :file_extension, :string
  end
end
