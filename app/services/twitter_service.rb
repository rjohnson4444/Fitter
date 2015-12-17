class TwitterService
  attr_reader :connection

  def initialize(current_user)
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_API_KEY']
      config.consumer_secret     = ENV['CONSUMER_API_SECRET']
      config.access_token        = current_user.oauth_token
      config.access_token_secret = current_user.oauth_token_secret
    end
  end

  def user
    connection.user
  end

  def tweets
    connection.home_timeline
  end

  def post_tweet(response)
    connection.update(response)
  end

  def favorite_a_tweet(tweet_id)
    connection.favorite(tweet_id.to_i)
  end
end
