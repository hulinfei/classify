source 'https://ruby.taobao.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
# 自动化测试
group :test do
  # rails测试
  gem 'rspec-rails'
  gem 'factory_bot'
  # 清空数据库
  gem 'database_cleaner'
  # 自动跑测试
  gem 'guard-rspec', require: false
  # 自动bundle
  gem 'guard-bundler', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
# 跨域
gem 'rack-cors', :require => 'rack/cors'

# mongodb
gem 'mongoid'
gem 'mongoid-tree', git: "https://github.com/hulinfei/mongoid-tree.git"
# 分页
gem 'kaminari'
gem 'kaminari-mongoid'
gem 'mongoid_orderable'
# 登陆
gem 'devise'
# 图片上传
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'carrierwave-upyun'
# 表单
gem 'simple_form'
# 权限管理
gem 'cancancan', '~> 2.0'
# 全局配置
gem 'config'
# 后台任务,定时任务
gem 'sidekiq'
gem 'redis'
gem "sidekiq-cron"
gem "mini_mime", '0.1.4'
# 微信相关
gem 'weixin_rails_middleware', git: "https://github.com/lanrion/weixin_rails_middleware.git" 
gem 'weixin_authorize', git: "https://github.com/lanrion/weixin_authorize.git"
gem "redis-namespace"
