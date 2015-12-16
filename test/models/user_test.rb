require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:tweets)

  test "the truth" do
    assert true
  end

  test "set up vcr" do
    user = User.create({"id"=>1, "name"=>"Ryan Johnson",
       "screen_name"=>"rjohnson44445",
       "uid"=>"4558022389",
       "oauth_token"=> ENV['USER_OAUTH_TOKEN'],
       "oauth_token_secret"=> ENV['USER_OAUTH_TOKEN_SECRET']
     })

    tweets = user.twitter.home_timeline.map(&:text)
    assert(tweets.last, "Be a part of something giant. Become a MongoDB World Sponsor! Find out more: https://t.co/SV98C6SlhC #MDBW16 https://t.co/Qlmt6OBVR1")
  end
end
