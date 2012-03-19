module SystemSiteMapsHelper
  def groups(id)
    system_site_maps = SystemSiteMap.where(:parent_id => id)
    if system_site_maps.count > 0
      result = "<ul>"
      system_site_maps.each do |system_site_map|
        result += "<li>"
        result += String(system_site_map.title)
        result += link_to('Show', system_site_map) + "|"
        result += link_to('Edit', edit_system_site_map_path(system_site_map)) + "|"
        result += link_to('Destroy', system_site_map, confirm: 'Are you sure?', method: :delete)
        result += "</li>"
        result += groups(system_site_map.id)
      end
      result += "</ul>"
      return result
    else
      return ""
    end
  end
end
