class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.time :start_time
      t.time :end_time
      t.integer :movie_id

      t.timestamps
    end
    add_foreign_key :schedules, :movies
  end
end
