class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
