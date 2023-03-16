class AddReadToBookrecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :book_recommendations, :read, :boolean, default: false
  end
end
