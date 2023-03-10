class CreatePodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :publisher
      t.string :image_url
      t.float :lenght
      t.text :description

      t.timestamps
    end
  end
end
