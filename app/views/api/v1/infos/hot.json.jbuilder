json.status 1
json.infos @infos do |info|
	json.id info.id.to_s
	json.title info.title
	json.description info.description
	json.phone info.phone
	json.details info.details
	json.address info.address
	json.imgs info.photos do |photo|
	  json.id photo.id.to_s
	  json.img_url photo.img_url
	end
	json.view info.view
	json.created_at info.created_at.strftime("%F %T")
	json.status info.status
end