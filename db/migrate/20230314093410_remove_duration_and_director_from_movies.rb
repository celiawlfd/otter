class RemoveDurationAndDirectorFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :director
    remove_column :movies, :duration
  end
end
