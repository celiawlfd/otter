class AddReferencesToListPodcast < ActiveRecord::Migration[7.0]
  def change
    add_column :list_podcasts, :comment, :string
    add_reference :list_podcasts, :list, foreign_key: true, null: false
    add_reference :list_podcasts, :podcast, foreign_key: true, null: false

  end
end
