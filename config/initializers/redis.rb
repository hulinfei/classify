$redis = Redis.new(url: "redis://#{Settings.redis.host}:#{Settings.redis.port}/0")