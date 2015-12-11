require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = YAML.load_file(File.join(__dir__, 'redis.yml')).symbolize_keys
end

require 'sidekiq/web'
map '/email-campaign-api' do
  run Sidekiq::Web
end