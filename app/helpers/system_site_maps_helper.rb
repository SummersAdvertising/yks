module SystemSiteMapsHelper
  def groups(id)
    system_site_maps = SystemSiteMap.where(:parent_id => id)
    if system_site_maps.count > 0
      result = "<ul>"
      system_site_maps.each do |system_site_map|
        result += "<li>"
        result += String(system_site_map.title)
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
