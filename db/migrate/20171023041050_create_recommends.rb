class CreateRecommends < ActiveRecord::Migration[5.1]
  def change
    create_table :recommends do |t|
    	t.references :foody, foreign_key: true
    	t.references :restaurant, foreign_key: true
    end
  end
end
