json.status 1
json.infos @infos do |info|
	json.id info.id.to_s
	json.title info.title
	json.description info.description
	json.phone info.phone
	json.details info.details
	json.imgs info.photos do |photo|
	  json.id photo.id.to_s
	  json.img_url photo.img_url
	end
	json.view info.view
	json.status info.status
	@info_types.each do |f|
		json.set! f.fieldname.to_sym, info[f.fieldname.to_sym]
	end
end
json.next_page @page

json.info_types	@info_types do |info_type|
	json.name info_type.name
	json.fieldname info_type.fieldname
	json.fieldtype info_type.fieldtype
	json.optype info_type.optype
	json.validation_rule info_type.validation_rule

end
