class CreatePodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.string :photo_url
      t.string :publisher
      t.float :duration
      t.integer :episode_number

      t.timestamps
    end
  end
end
