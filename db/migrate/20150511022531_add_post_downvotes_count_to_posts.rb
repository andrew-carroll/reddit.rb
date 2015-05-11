class AddPostDownvotesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_downvotes_count, :integer
  end
end
