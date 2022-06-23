# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
set :environment, :development
# cronのログの吐き出し場所
set :output, 'log/cron.log'
ENV.each { |k, v| env(k, v) }

#every 1.minutes do
every 1.day, at: '7pm' do
  rake 'notifications:notice_mail'
end

#every 1.minutes do
every 1.day, at: '0pm' do
  rake 'rankings:movie_reservation_count'
end