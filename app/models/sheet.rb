class Sheet < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :screen
  belongs_to :theater
end
