class Subreddit::PostsController < ApplicationController
  before_action :set_subreddit
  before_action :authenticate, only: [:new, :create]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to comments_path(@subreddit, @post)
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      redirect_to new_subreddit_post_path(@subreddit)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url).
      merge(subreddit: @subreddit, user: current_user)
  end

  def set_subreddit
    @subreddit = Subreddit.find_by_name(params[:subreddit_id])
  end
end
