class WxUserSubscribeWorker
	include Sidekiq::Worker

	def perform(site_id, openid)
		site = Site.find(site_id)
		wx_user = site.wx_users.find_by(openid: openid)
		if wx_user
			wx_user.update(subscribe: 1, subscribe_time: Time.now, unsubscribe_time: nil)
		else
			message = site.client.user(openid)
			wx_user_hash = message.result
			site.wx_users.create(subscribe: wx_user_hash[:subscribe],
				openid: wx_user_hash[:openid],
				nickname: wx_user_hash[:nickname],
				sex: wx_user_hash[:sex],
				language: wx_user_hash[:language],
				city: wx_user_hash[:city],
				province: wx_user_hash[:province],
				country: wx_user_hash[:country],
				headimgurl: wx_user_hash[:headimgurl],
				subscribe_time: wx_user_hash[:subscribe_time],
				remark: wx_user_hash[:remark],
				groupid: wx_user_hash[:groupid])
		end
	end

end
