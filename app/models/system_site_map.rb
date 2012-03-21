class SystemSiteMap < ActiveRecord::Base
  has_one :service
  has_many :system_site_maps
  belongs_to :system_site_map
end
