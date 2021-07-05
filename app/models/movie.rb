class Movie < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :year, :is_showing, :description, :image_url, presence: true
end