class AddMovieGenreIdToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :movie_genre_id, :integer
  end
end
