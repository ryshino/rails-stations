class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @movies = Movie.joins(schedules: :reservations).group(:id).where(reservations: { date: Time.zone.now.beginning_of_day...Time.zone.now.since(7.days).end_of_day, user_id: @user.id })
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
end