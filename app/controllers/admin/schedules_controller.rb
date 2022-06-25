class Admin::SchedulesController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @schedules = Schedule.includes(:movie)
  end

  def new
    @schedule = Schedule.new
    @movie = Movie.find_by(id: params[:format])
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      flash[:notice] = '作成に成功しました'
      redirect_to admin_schedules_path
    else
      flash.now[:alert] = '作成に失敗しました'
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])    
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update(schedule_params) 
      flash[:notice] = "登録内容を更新しました"
      redirect_to admin_schedules_path
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])

    @schedule.destroy
    flash[:notice] = 'スケジュールを削除しました'
    redirect_to admin_schedules_path
  end



  private
  
  def schedule_params
    params[:schedule].permit(:movie_id, :start_time, :end_time)
  end
end
