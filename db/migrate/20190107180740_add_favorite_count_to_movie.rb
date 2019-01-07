class AddFavoriteCountToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :favorite_count, :integer
  end
end
