class AddLinkToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :link, :string
  end
end
