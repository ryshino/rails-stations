class Screen < ApplicationRecord
  has_many :movies, dependent: :destroy
end
