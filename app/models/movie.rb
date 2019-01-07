class Movie < ApplicationRecord
  # if :photo.to_s.include?("https://image.tmdb.org")
  mount_uploader :photo, PhotoUploader
  # end
  # binding.pry
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :resume, presence: true
  validates :photo, presence: true

  scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }

end
