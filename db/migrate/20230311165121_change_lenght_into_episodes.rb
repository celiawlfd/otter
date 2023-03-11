class ChangeLenghtIntoEpisodes < ActiveRecord::Migration[7.0]
  def change
    remove_column :podcasts, :lenght
    add_column :podcasts, :episode_count, :integer
  end
end
