class CreateListPodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :list_podcasts do |t|

      t.timestamps
    end
  end
end
