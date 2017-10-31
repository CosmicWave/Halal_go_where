class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

    	t.string :title
        t.string :restaurant
    	t.text   :description
    	t.string :avatar
        t.string :tag_list
    	t.decimal :price, precision: 12, scale: 3

    	t.timestamps

    	t.references :foody, foreign_key: true
        t.references :tag, foreign_key: true
       
    end
  end
end
