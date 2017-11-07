class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

    	t.string :title
        t.string :restaurant
    	t.text   :description
    	t.string :avatar
    	t.decimal :price, precision: 12, scale: 3
        t.integer :rating, default: 0
    	t.timestamps

    	t.references :foody, foreign_key: true

    end
  end
end
