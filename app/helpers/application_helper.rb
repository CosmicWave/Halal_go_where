module ApplicationHelper

	def photo_tags(photo)
		raw photo.tag_list.map { |t| link_to t, tag_path(t)}.join(', ') 
	end
end
