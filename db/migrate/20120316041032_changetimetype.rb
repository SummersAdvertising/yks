class Changetimetype < ActiveRecord::Migration
  def up
    change_column :banners, :time, :datetime
        change_column :services, :time, :datetime
            change_column :tickets, :time, :datetime
              change_column :user_exps, :time, :datetime
  end
end
