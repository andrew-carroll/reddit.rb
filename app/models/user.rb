class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username
  has_many :subreddits

  class AlreadyVotedError < StandardError; end
  def upvote(post)
    raise AlreadyVotedError if already_voted?(post)
    post.upvotes.create!(user: self)
  end

  def downvote(post)
    raise AlreadyVotedError if already_voted?(post)
    post.downvotes.create!(user: self)
  end

  private

  def already_voted?(post)
    upvoted = post.upvotes.find_by(user: self)
    downvoted = post.downvotes.find_by(user: self)
    upvoted or downvoted
  end
end
