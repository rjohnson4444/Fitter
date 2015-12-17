require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def service
    @service = TwitterService.new(users(:one))
  end

  test "#user" do
    VCR.use_cassette("twitter_service#user") do
      user = service.user

      assert_equal "Ryan Johnson", user.name
      assert_equal "rjohnson44445", user.screen_name
    end
  end

  test "#post_tweet" do
    VCR.use_cassette("twitter_service#post_tweet") do
      text = "This is a response tweet"
      tweet_posted = service.post_tweet(text)

      assert tweet_posted.created?

      last_tweet = service.tweets.first

      assert_equal text, last_tweet.text
    end
  end

  test "#tweets" do
    VCR.use_cassette("twitter_service#tweets") do
      tweets = service.tweets
      tweet = tweets.first

      assert_equal 19, tweets.count
      assert_equal "This is a response tweet", tweet.text
    end
  end

  test "#favorite_a_tweet" do
    VCR.use_cassette("twitter_service#favorite_a_tweet", allow_playback_repeats: true) do
      unfavorited_tweet = service.tweets.last

      refute unfavorited_tweet.favorited?

      favorited_tweet = service.favorite_a_tweet(unfavorited_tweet.id).first

      assert favorited_tweet.favorited?
      assert_equal favorited_tweet.id, unfavorited_tweet.id
    end
  end
end
