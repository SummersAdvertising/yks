class CreateKnackCategories < ActiveRecord::Migration
  def change
    create_table :knack_categories do |t|
      t.string :title
      t.string :description
      t.string :status
      t.integer :sort

      t.timestamps
    end
  end
end
