def sub_cates(root, json)
	if root.children.any?
		json.sub_cates root.children do |child|
          	json.name child.name
          	json.icon_url child.icon_url
			sub_cates(child, json)
		end
	end
end
json.status 1
json.categories Category.roots do |category|
	json.name category.name
	json.icon_url category.icon_url
	sub_cates(category, json)
end