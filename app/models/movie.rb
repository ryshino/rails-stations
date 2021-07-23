class Movie < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :year, :description, :image_url, presence: true

  def search(keyword)
    keyword ? where('name LIKE ? OR description LIKE ?', "%#{keyword}%","%#{keyword}%") :all
  end
end