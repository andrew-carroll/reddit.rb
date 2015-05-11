class Post < ActiveRecord::Base
  validates :subreddit, presence: true
  validates :title, presence: true

  has_many :comments
  has_many :upvotes, class_name: :PostUpvote
  has_many :downvotes, class_name: :PostDownvote
  belongs_to :subreddit, required: true
  belongs_to :user, required: true

  after_create :free_upvote

  private

  def free_upvote
    user.upvote(self)
  end

end
