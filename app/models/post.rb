class Post < ActiveRecord::Base
  validates :subreddit, presence: true
  validates :title, presence: true

  has_many :comments
  belongs_to :subreddit, required: true
end
