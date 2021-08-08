class SchedulesController < ApplicationController
  def index
    @sheets = Sheet.all
  end
end
