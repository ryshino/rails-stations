class Theater < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :screens, dependent: :destroy
  has_many :sheets, dependent: :destroy
end
