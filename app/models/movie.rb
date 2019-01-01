class Movie < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :resume, presence: true
  validates :photo, presence: true
end
