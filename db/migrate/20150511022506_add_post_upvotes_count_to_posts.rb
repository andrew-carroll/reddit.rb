class AddPostUpvotesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_upvotes_count, :integer
  end
end
