class Post::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_subreddit
  before_action :authenticate, only: [:create]
  def index
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @comment = Comment.new(
      body: comment_params[:body],
      user: current_user,
      post: @post
    )
    unless @comment.save
      flash[:error] = @comment.errors.full_messages.to_sentence
    end
    redirect_to comments_path(@subreddit, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_subreddit
    @subreddit = Subreddit.find_by_name(params[:subreddit_id])
  end
end
