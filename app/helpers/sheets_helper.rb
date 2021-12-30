module SheetsHelper
  def check_reservation(reservations, sheet, schedule, date)
    result = false
    reservations_count = reservations.size
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:sheet_id].eql?(sheet.id) && reservation[:schedule_id].eql?(schedule.id) && reservation[:date].eql?(Date.parse(date))
        return result if result
      end
    elsif reservations_count == 1
      result = reservation[:sheet_id].eql?(sheet.id) && reservation[:schedule_id].eql?(schedule.id) && reservation[:date].eql?(Date.parse(date))
      return result if result
    end
    return result    
  end
end