class Changenewstimetype < ActiveRecord::Migration
  def change
    
      change_column :news, :time, :datetime
  end
end
