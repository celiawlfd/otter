class CreateMovieRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_recommendations do |t|
      t.references :movie, null: false, foreign_key: true
      t.integer :giver_id, null: false
      t.integer :receiver_id, null: false
      t.text :message

      t.timestamps
    end

    add_index :movie_recommendations, :giver_id
    add_index :movie_recommendations, :receiver_id
  end
end
