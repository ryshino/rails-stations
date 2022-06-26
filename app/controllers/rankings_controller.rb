class RankingsController < ApplicationController
  
  def movie_reservation_count
    @schedules = Schedule.joins(:reservations).select('schedules.id, schedules.movie_id, count(reservations.id) as reservation_count').
                          group(:id).where(reservations: { created_at: Time.zone.yesterday.beginning_of_day...Time.zone.yesterday.end_of_day }).order('reservation_count desc')
    @movies = Movie.joins(schedules: :reservations).group("schedules.id").where(reservations: { created_at: Time.zone.yesterday.beginning_of_day...Time.zone.yesterday.end_of_day })
    @movies.each do |movie|
      @reservation_count = @schedules.find_by(movie_id: movie.id).reservation_count
      @movie_name = movie.name
      @date = Time.zone.yesterday
      Ranking.create(date: @date, movie_name: @movie_name, reservation_count: @reservation_count, movie_id: movie.id)
    end
  end

  def movie_reservation_ranking
    @rankings = Movie.joins(:rankings).select('movies.id, movies.name, sum(rankings.reservation_count) as reservation_count').
                      group(:id).where(rankings: { created_at: Time.zone.now.ago(30.days).beginning_of_day...Time.zone.yesterday.beginning_of_day}).order('reservation_count desc')
                      
    if user_signed_in?
      @user = User.find_by(id: current_user.id)
    end
  end
  
end