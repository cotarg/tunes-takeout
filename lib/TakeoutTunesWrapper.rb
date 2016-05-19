require 'HTTParty'

module TakeoutTunesWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

    def self.search(keyword)
      @data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
    end

    def self.top(number_of_suggestions=20)
      @data = HTTParty.get(BASE_URL + "/v1/suggestions/top?limit=#{number_of_suggestions}").parsed_response
    end

end