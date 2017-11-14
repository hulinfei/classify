def sub_cates(root, json)
	if root.children.any?
		json.sub_cates root.children do |child|
			json.id child.id.to_s
          	json.name child.name
          	json.icon_url child.icon_url('30x30')
			sub_cates(child, json)
		end
	end
end
json.status 1
json.categories Category.roots do |category|
	json.id category.id.to_s
	json.name category.name
	json.icon_url category.icon_url('30x30')
	sub_cates(category, json)
end