class AddReadToPodcastrecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :podcast_recommendations, :read, :boolean
  end
end
