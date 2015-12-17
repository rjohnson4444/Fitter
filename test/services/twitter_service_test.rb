require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def service
    @service = TwitterService.new(users(:one))
  end

  test "#user" do
    VCR.use_cassette("twitter_service#user") do
      user = service.user

      assert_equal "Ryan", user.name
      assert_equal "rjohnson44445", user.screen_name
    end
  end

  test "#tweets" do
    VCR.use_cassette("twitter_service#tweets") do
      tweets = service.tweets
      tweet = tweets.first

      assert_equal 19, tweets.count
      assert_equal "How the Services team uses GitHub: https://t.co/BFYqCchC4R", tweet.text
    end
  end

  test "#post_tweet" do
    VCR.use_cassette("twitter_service#post_tweet") do
      response = "This is a response tweet"
      tweet_posted = service.post_tweet(response)
      my_tweet = service.tweets.first

      assert_equal
    end
  end
end
