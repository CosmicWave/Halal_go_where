class AddAvatarToFoodies < ActiveRecord::Migration[5.1]
  def change
    add_column :foodies, :avatar, :string
  end
end
