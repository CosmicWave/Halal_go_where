module FoodiesHelper
	def avatar_for(foody, options = { size: 80} )
		size = options[:size]
		if foody.avatar?
			image_tag foody.avatar.url(:thumb), width: size, class: 'avatar_img'
		else
			image_tag "image1.jpg", width: size, class: 'avatar_img'
		end
	end
end