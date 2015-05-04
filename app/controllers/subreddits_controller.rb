class SubredditsController < ApplicationController
  before_action :authenticate

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = current_user.subreddits.new(subreddit_params)
    if @subreddit.save
      redirect_to subreddit_path(@subreddit)
    else
      flash[:error] = @subreddit.errors.full_messages.to_sentence
      redirect_to new_subreddit_path
    end
  end

  private

  def subreddit_params
    params.require(:subreddit).permit(:name)
  end

  def authenticate
    redirect_to login_path unless current_user
  end
end
