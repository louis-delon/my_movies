class AddTypesAndLanguageToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :type, :string
    add_column :movies, :language, :string
  end
end
