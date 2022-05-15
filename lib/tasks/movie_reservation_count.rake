namespace :rankings do
  desc 'ランキングの集計'
  task movie_reservation_count: :environment do
    RankingsController.new.movie_reservation_count
  end
end