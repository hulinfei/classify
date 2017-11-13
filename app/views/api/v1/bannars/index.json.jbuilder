json.status 1
json.bannars @bannars do |bannar|
	json.title bannar.title
	json.url bannar.url
	json.image_url bannar.avatar_url
end