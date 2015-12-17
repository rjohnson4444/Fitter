class DashboardController < ApplicationController
  def show
    tweet_info = build_twitter_service
    @user = tweet_info.user
    @tweets = tweet_info.tweets
  end

  def create
    build_twitter_service.post_tweet(params[:tweet][:body])
    redirect_to dashboard_path
  end

  def update
    build_twitter_service.favorite_a_tweet(params[:format])
    redirect_to dashboard_path
  end

  private

    def build_twitter_service
      @service ||= TwitterService.new(current_user)
    end
end
