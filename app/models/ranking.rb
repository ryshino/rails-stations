class Ranking < ApplicationRecord
  belongs_to :movie

  validates :date ,:movie_name, :reservation_count, :movie_id, presence: true
  validates :date, uniqueness: { scope: [:movie_name, :movie_id] }
end