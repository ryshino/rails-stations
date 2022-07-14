class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :content, :score, presence: true
end
