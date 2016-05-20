require 'yelp'
require 'rspotify'
require 'TakeoutTunesWrapper'

module SuggestionsHelper

  def convert_suggestion_id_to_food_asset(result_of_suggestion_pair)
    # takes a suggestion.new
    # runs Yelp.client.business search on Food ID

    yelp_hash = Yelp.client.business(result_of_suggestion_pair["food_id"])

    # returns object containing Yelp.client.business search for digestion by partial
  end

  def convert_suggestion_id_to_spotify_asset(result_of_suggestion_pair)
    # takes a suggestion.new
    # runs Spotify search on music ID, music type
    spotify_asset_type = result_of_suggestion_pair["music_type"]
    if spotify_asset_type == "album"
      spotify_asset = RSpotify::Album.find(result_of_suggestion_pair["music_id"])
    elsif spotify_asset_type == "track"
      spotify_asset = RSpotify::Track.find(result_of_suggestion_pair["music_id"])
    elsif spotify_asset_type == "artist"
      spotify_asset = RSpotify::Artist.find(result_of_suggestion_pair["music_id"])
    end
    
    # returns object with Spotify search
    spotify_asset
  end

  def construct_single_suggestion_complete_object(pair_id)
    # converts a pair_id to a pair object
    pair = TakeoutTunesWrapper.pair(pair_id)["suggestion"] 
    yelp = convert_suggestion_id_to_food_asset(pair)
    spotify = convert_suggestion_id_to_spotify_asset(pair)

    suggestion = {pair: pair, yelp: yelp, spotify: spotify}
  end



end
