class Defines < ActiveRecord::Migration
def change
  rename_column(:defines, :type, :usetype) 
end
end
