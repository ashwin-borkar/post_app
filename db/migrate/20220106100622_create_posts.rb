class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :image
      t.string :short_desc
      t.text :description

      t.timestamps
    end
  end
end
