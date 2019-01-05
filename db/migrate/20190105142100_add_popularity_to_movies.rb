class AddPopularityToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :popularity, :string
  end
end
