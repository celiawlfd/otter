class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :year, default: ""
      t.integer :duration, default: ""
      t.string :photo_url
      t.string :director, null: false

      t.timestamps
    end
  end
end
