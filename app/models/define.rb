# encoding: utf-8
class Define < ActiveRecord::Base
  has_many :users
  has_many :tickets
  
  validates_presence_of :name, :message => ' 項目名稱不得為空白 '
end
