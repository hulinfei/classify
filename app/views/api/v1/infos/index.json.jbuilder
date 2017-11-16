json.status 1
json.infos @infos do |info|
	json.title info.title
	json.description info.description
	json.phone info.phone
	json.view info.view
	json.status info.status
	json.info_types	Hash[@info_types.map{|info_type|[info_type.fieldname, info[info_type.fieldname]]}]
end