class WxUserUnsubscribeWorker
	include Sidekiq::Worker

	def perform(site_id, openid)
		site = Site.find(site_id)
		wx_user = site.wx_users.find_by(openid: openid)
		if wx_user
			wx_user.update(subscribe: 0, unsubscribe_time: Time.now)
		end
	end

end
