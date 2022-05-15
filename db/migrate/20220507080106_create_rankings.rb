class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.date :date, null: false
      t.string :movie_name, null: false
      t.integer :reservation_count, null: false
      t.references :movie, null: false, index: false, foreign_key: true

      t.timestamps
    end
    add_index :rankings, [:date ,:movie_name, :movie_id], unique: true
  end
end
