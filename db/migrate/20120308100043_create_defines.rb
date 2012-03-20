class CreateDefines < ActiveRecord::Migration
  def change
    create_table :defines do |t|
      t.string :type
      t.string :id
      t.string :name

      t.timestamps
    end
  end
end
