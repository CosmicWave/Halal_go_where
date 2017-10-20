class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

    	t.string :title
    	t.text   :description
    	t.string :avatar
    	t.decimal :price, precision: 12, scale: 3

    	t.timestamps

    	t.references :foody, foreign_key: true
    end
  end
end
