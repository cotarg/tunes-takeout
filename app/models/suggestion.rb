require 'HTTParty'
require 'RSpotify'
require 'yelp'
require 'TakeoutTunesWrapper'

client = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          })

class Suggestion < ActiveRecord::Base

  def initialize(pair_id)
    @pair = pair_id
    @food_id = TakeoutTunesWrapper.food_id(pair_id)
    @music_id = TakeoutTunesWrapper.music_id(pair_id)
    @music_type = TakeoutTunesWrapper.music_type(pair_id)
  end

  def self.yelp_hash(pair_id)
    business_hash = client.business(TakeoutTunesWrapper.food_id(pair_id))
  end

end
