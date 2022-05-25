class Movie < ApplicationRecord
  mount_uploader :image_url, MoiveUploader

  has_many :schedules, dependent: :destroy
  has_many :rankings, dependent: :destroy

  belongs_to :screen
  belongs_to :theater

  validates :name, uniqueness: { scope: [:theater_id]}
  validates :name, uniqueness: { scope: [:screen_id]}
  validates :name, :year, :description, :image_url, :screen_id, presence: true

  scope :search, -> (search_params) do
    return if search_params.blank?

    keyword_like(search_params[:keyword])
      .is_showing(search_params[:is_showing])
      .theater_id(search_params[:theater_id])
  end

  scope :keyword_like, -> (keyword) { where(["name like? OR description like?", "%#{keyword}%", "%#{keyword}%"]) if keyword.present? }
  scope :is_showing, -> (is_showing) { where(is_showing: is_showing) if is_showing.present? }
  scope :theater_id, -> (theater_id) { where(theater_id: theater_id) if theater_id.present? }
end