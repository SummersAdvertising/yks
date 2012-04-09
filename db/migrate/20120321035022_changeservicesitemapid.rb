class Changeservicesitemapid < ActiveRecord::Migration
  def change
    rename_column :services, :system_site_maps_id, :system_site_map_id
  end
end