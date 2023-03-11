class CreatePodcastReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :podcast_reviews do |t|
      t.text :content
      t.integer :rating
      t.references :podcast, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
