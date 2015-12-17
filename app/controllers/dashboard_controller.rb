class DashboardController < ApplicationController
  def show
    tweet_info = TwitterService.new(current_user)
    @user = tweet_info.user
    @tweets = tweet_info.tweets
  end
end
