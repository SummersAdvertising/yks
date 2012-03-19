class AddTitleToSystemsitemaps < ActiveRecord::Migration
  def change
  	add_column :system_site_maps, :title, :string
  end
end
