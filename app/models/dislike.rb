class Dislike < ApplicationRecord

	belongs_to :foody
	belongs_to :photo

	def like_this(current_dislike)
        Like.create(foody_id: current_dislike.foody.id, photo_id: current_dislike.photo.id)
        current_dislike.destroy
    end

    def dislike_this(current_like)
        Dislike.create(foody_id: current_like.foody.id, photo_id: current_like.photo.id)
        current_like.destroy
    end

end