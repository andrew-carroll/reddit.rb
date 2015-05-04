class Subreddit::PostsController < ApplicationController
  before_action :set_subreddit

  def index
  end

  private

  def set_subreddit
    @subreddit = Subreddit.find_by_name(params[:subreddit_id])
  end
end
