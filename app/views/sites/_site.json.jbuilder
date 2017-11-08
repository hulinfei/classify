json.extract! site, :id, :name, :weixin_appid, :weixin_appsecret, :weixin_secret_key, :weixin_token, :created_at, :updated_at
json.url site_url(site, format: :json)
