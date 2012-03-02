module SystemSiteMapsHelper
  def groups()
    SystemSiteMap.where(:parent_id => '').each do |system_site_map|
      return String(system_site_map.id) + "<br><br>"
    end
  end
end
