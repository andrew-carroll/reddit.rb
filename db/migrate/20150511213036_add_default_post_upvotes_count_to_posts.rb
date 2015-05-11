class AddDefaultPostUpvotesCountToPosts < ActiveRecord::Migration
  def change
    change_column_default :posts, :post_upvotes_count, 0
  end
end
