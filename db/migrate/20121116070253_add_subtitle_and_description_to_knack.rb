class AddSubtitleAndDescriptionToKnack < ActiveRecord::Migration
  def change
  	add_column :knacks, :subtitle, :string
  	add_column :knacks, :description, :text
  end
end
