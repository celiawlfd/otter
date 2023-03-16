class AddReadToMovierecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :movie_recommendations, :read, :boolean
  end
end
