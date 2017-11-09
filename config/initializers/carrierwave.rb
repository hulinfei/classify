CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "bobo"
  config.upyun_password = 'lendlove'
  config.upyun_bucket = "classify"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "http://classify.test.upcdn.net"
end