module TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

    def self.search(keyword)
      @data = HTTParty.get(BASE_URL + "v1/suggestions/search?query=" + keyword).parsed_response
    end

    def self.top(number_of_suggestions)
      @data = HTTParty.get(BASE_URL + "/v1/suggestions/top").parsed_response
    end

end