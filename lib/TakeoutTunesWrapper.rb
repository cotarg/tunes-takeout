require 'HTTParty'
require 'RSpotify'
require 'yelp'

module TakeoutTunesWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

    def self.search(keyword)
      @suggestion_search = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
    end

    def self.top(number_of_suggestions=20)
      @top_suggestions = HTTParty.get(BASE_URL + "v1/suggestions/top?limit=#{number_of_suggestions}").parsed_response
    end

    def self.pair(pair_id)
      @pair_hash = HTTParty.get(BASE_URL + "v1/suggestions/#{pair_id}").parsed_response
    end

    # def self.music_id(pair_id)
    #   @music_id = self.pair(pair_id)["music_id"]
    # end

    # def self.music_type(pair_id)
    #   self.pair(pair_id)["music_type"]
    # end

    # def self.food_id(pair_id)
    #     self.pair(pair_id)["food_id"]
    # end

end