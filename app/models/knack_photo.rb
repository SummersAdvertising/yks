class KnackPhoto < ActiveRecord::Base
  belongs_to :knack
  attr_accessible :name, :path, :post_id
  validates :path, :uniqueness => true
  validates :name, :presence => true
end
