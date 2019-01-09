class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :movie, counter_cache: true
end

