class Post::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_subreddit
  def index
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_subreddit
    @subreddit = Subreddit.find_by_name(params[:subreddit_id])
  end
end
