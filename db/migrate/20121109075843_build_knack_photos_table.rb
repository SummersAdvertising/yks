class BuildKnackPhotosTable < ActiveRecord::Migration
  def up
    create_table :knack_photos do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end

  def down
  	drop_table :knack_photos
  end
end
