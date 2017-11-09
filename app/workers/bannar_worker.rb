class BannarWorker
	include Sidekiq::Worker

	def perform()
		time = Time.new.strftime("%Y-%m-%d")
		Bannar.all.each do |bannar|
			endtime = bannar.end_time.strftime("%Y-%m-%d")
			if time == endtime
				Bannar.find(bannar.id).update(active: false)
			end
		end
	end
end
