module SuggestionsHelper

  def convert_suggestion_id_to_food_asset(result_of_suggestion_pair)
    # takes a suggestion.new
    # runs Yelp.client.business search on Food ID

    yelp_hash = Yelp.client.business(result_of_suggestion_pair["food_id"]).parsed_response

    # returns object containing Yelp.client.business search for digestion by partial
  end

  def convert_suggestion_id_to_spotofy_asset(result_of_suggestion_pair)
    # takes a suggestion.new
    # runs Spotify search on music ID, music type
    spotify_hash = 

    # returns object with Spotify search
  end

  def construct_single_suggestion_complete_object(pair_id)
    # converts a pair_id to a pair object
    pair = Suggestion.new(pair_id)
    yelp = convert_suggestion_id_to_food_asset(pair)
    spotify = 

  end



end
