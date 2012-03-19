class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :id
      t.string :user
      t.string :password
      t.string :type

      t.timestamps
    end
  end
end
