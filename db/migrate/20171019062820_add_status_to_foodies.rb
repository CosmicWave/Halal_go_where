class AddStatusToFoodies < ActiveRecord::Migration[5.1]
  def change
  	add_column :foodies, :status, :text
  end
end
