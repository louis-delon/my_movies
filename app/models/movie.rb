class Movie < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :resume, presence: true
  validates :photo, presence: true

  # scope :most_recent, -> (limit) { order("created_at desc").limit(limit) }
  scope :most_popular, -> () { order("favorite_count DESC") }
  scope :own_movies, -> (user) { user.movies }
  scope :most_recent, -> () { order('created_at DESC') }
end
