class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false, limit: 40_000
      t.belongs_to :user, index: true, null: false, foreign_key: true
      t.belongs_to :post, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
