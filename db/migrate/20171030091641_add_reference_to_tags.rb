class AddReferenceToTags < ActiveRecord::Migration[5.1]
  def change

		add_reference :tags, :restaurant, index: true
		add_foreign_key :tags, :restaurants
			
		add_reference :tags, :photo, index: true
		add_foreign_key :tags, :photos
  end
end
