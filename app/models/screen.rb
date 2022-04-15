class Screen < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :sheets, dependent: :destroy
  belongs_to :theater
end
