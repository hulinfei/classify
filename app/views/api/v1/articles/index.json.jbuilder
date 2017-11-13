json.status 1
json.articles @articles do |article|
	json.title article.title
	json.description article.description
	json.phone article.phone
	json.view article.view
	json.details article.details
	json.status article.status
end