class Allstatuschange < ActiveRecord::Migration
def change
  change_column :defines, :status, :string
  change_column :user_exps, :status, :string
  change_column :banners, :status, :string
  change_column :news, :status, :string
  change_column :services, :status, :string
  change_column :tickets, :status, :string
end
end
