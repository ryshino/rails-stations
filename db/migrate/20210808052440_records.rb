class Records < ActiveRecord::Migration[6.1]
  def change
    drop_table :schedules
  end
end
