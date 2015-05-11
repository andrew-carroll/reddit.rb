class CreatePostUpvotes < ActiveRecord::Migration
  def change
    create_table :post_upvotes do |t|
      t.belongs_to :post, index: true, null: false, foreign_key: true
      t.belongs_to :user, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
    add_index :post_upvotes, [:post_id, :user_id], unique: true
  end
end
