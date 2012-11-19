class AddKnackIdToKnackphoto < ActiveRecord::Migration
  def change
  	add_column :knack_photos, :knack_id, :integer
  end
end
