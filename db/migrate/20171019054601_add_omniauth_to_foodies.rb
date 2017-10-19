class AddOmniauthToFoodies < ActiveRecord::Migration[5.1]
  def change
    add_column :foodies, :provider, :string
    add_column :foodies, :uid, :string
    add_column :foodies, :name, :string
    add_column :foodies, :image, :text
  end
end
