class AddUsersToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true, null: false, foreign_key: true
  end
end
