class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  
  validates :name, presence: true
  
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  uniqueness: { case_sensitive: false }

  validates_uniqueness_of :date, scope: [:schedule_id,
  :sheet_id]
end
