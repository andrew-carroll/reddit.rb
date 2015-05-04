class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :name, null: false
      t.belongs_to :user, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
    add_index :subreddits, :name, unique: true
  end
end
