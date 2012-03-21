module SystemSiteMapsHelper
  def groups(id)
    system_site_maps = SystemSiteMap.where(:system_site_map_id => id)
    if system_site_maps.count > 0
      result = "<ul>"
      system_site_maps.each do |system_site_map|
        result += "<li>"
        result += system_site_map.title.to_s
        result += render 'shared/admin_list_command', :data => system_site_map
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
