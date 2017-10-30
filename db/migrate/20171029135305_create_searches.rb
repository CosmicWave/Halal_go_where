class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
    	t.string :keyword
    	t.string :certification
    	t.string :location
    	t.string :category
    	t.decimal :min_price
    	t.decimal :max_price
    end
  end
end
