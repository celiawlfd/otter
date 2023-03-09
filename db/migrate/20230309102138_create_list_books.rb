class CreateListBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :list_books do |t|
      t.string :comment
      t.references :list, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end