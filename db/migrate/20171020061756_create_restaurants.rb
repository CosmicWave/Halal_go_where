class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.text :description
    	t.string :location
    	t.string :time
    	t.string :certification
    	t.string :category

        t.references :tag, foreign_key: true
    end
  end
end
