class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename
      t.text :properties

      t.timestamps
    end
  end
end
