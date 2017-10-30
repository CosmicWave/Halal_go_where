class CreateLikeables < ActiveRecord::Migration[5.1]
  def change
    create_table :likeables do |t|
    	t.integer :review, default: 1
    	t.references :foody, foreign_key: true
    	t.references :photo, foreign_key: true
    end
  end
end
