class Addserviceprice < ActiveRecord::Migration
  def change
    add_column :services, :price, :content
  end
end
