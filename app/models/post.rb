class Post < ActiveRecord::Base
  belongs_to :subreddit, required: true
  validates :subreddit, presence: true
  validates :title, presence: true
end
