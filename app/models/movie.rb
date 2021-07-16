class Movie < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :year, :description, :image_url, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?

    keyword_like(search_params[:keyword])
      .is_showing(search_params[:is_showing])
  end

  scope :keyword_like, -> (keyword) { where(["name like? OR description like?", "%#{keyword}%", "%#{keyword}%"]) if keyword.present? }
  scope :is_showing, -> (is_showing) { where(is_showing: is_showing) if is_showing.present? }
end