class Location < ActiveRecord::Migration
  def change
    add_column :services, :system_site_maps_id, :integer
  end
end
