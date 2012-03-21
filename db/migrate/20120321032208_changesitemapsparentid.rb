class Changesitemapsparentid < ActiveRecord::Migration
  def change
  change_column :system_site_maps, :parent_id, :integer
    rename_column :system_site_maps, :parent_id, :system_site_map_id
  end
end
