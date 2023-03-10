class AddPhotoUrlToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :photo_url, :string
  end
end
