json.status 1
json.wx_users @wx_users do |wx_user|
	json.subscribe wx_user.subscribe
	json.openid wx_user.openid
	json.nickname wx_user.nickname
	json.sex wx_user.sex
	json.language wx_user.language
	json.city wx_user.city
	json.province wx_user.province
	json.country wx_user.country
	json.headimgurl wx_user.headimgurl
	json.subscribe_time wx_user.subscribe_time
	json.unionid wx_user.unionid
	json.remark wx_user.remark
	json.groupid wx_user.groupid
	json.tagid_list wx_user.tagid_list
end