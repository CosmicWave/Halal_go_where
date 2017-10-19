class AddNameToFoodies < ActiveRecord::Migration[5.1]
  def change
  	add_column :foodies, :name, :text
  end
end
