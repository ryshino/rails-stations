class Movie < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :year, :description, :image_url, presence: true
end