class Movie < ApplicationRecord
  # if :photo.to_s.include?("https://image.tmdb.org")
  mount_uploader :photo, PhotoUploader
  # end
  # binding.pry
  belongs_to :user
  validates :title, presence: true
  validates :resume, presence: true
  validates :photo, presence: true
end
