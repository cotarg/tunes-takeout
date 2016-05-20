require 'HTTParty'
require 'RSpotify'
require 'yelp'
require 'TakeoutTunesWrapper'

class Suggestion < ActiveRecord::Base

  def initialize(pair_id)
    @pair = pair_id
    @food_id = TakeoutTunesWrapper.food_id(pair_id)
    @music_id = TakeoutTunesWrapper.music_id(pair_id)
    @music_type = TakeoutTunesWrapper.music_type(pair_id)
  end

  def self.yelp_hash(pair_id)
    business_hash = Yelp.client.business(TakeoutTunesWrapper.food_id(pair_id))
  end

end
