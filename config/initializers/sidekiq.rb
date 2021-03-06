Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://192.168.0.112:6379/15' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://192.168.0.112:6379/15' }
end
schedule_file = "config/schedule.yml"

if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end