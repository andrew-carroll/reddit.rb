class AddDefaultPostDownvotesCountToPosts < ActiveRecord::Migration
  def change
    change_column_default :posts, :post_downvotes_count, 0
  end
end
