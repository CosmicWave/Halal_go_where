class CreateDislikes < ActiveRecord::Migration[5.1]
  def change
    create_table :dislikes do |t|
    	t.references :foody, foreign_key: true
    	t.references :photo, foreign_key: true
    end
  end
end
