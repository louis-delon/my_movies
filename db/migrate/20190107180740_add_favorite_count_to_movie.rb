class AddFavoriteCountToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :favorites_count, :integer, default: 0
  end
end
