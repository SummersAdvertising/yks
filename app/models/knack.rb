class Knack < ActiveRecord::Base
	belongs_to :knack_category
	has_many :knack_photos, :dependent => :destroy
end
