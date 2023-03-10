class RemoveImageUrlToPodcast < ActiveRecord::Migration[7.0]
  def change
    remove_column :podcasts, :image_url
  end
end
