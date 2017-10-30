class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|

    	t.references :restaurant, foreign_key: true
    	t.references :photo, foreign_key: true


    end
  end
end
