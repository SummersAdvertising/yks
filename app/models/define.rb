class Define < ActiveRecord::Base
  has_many :users
  has_many :tickets
end