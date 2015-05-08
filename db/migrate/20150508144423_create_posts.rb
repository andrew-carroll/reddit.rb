class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.belongs_to :subreddit, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
