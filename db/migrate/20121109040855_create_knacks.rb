class CreateKnacks < ActiveRecord::Migration
  def change
    create_table :knacks do |t|
      t.string :title
      t.timestamp :date
      t.text :content
      t.string :status
      t.integer :knack_category_id

      t.timestamps
    end
  end
end
