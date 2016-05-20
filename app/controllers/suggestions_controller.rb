require 'HTTParty'
require 'TakeoutTunesWrapper'
require 'yelp'

client = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                            consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                            token: ENV["YELP_TOKEN"],
                            token_secret: ENV["YELP_TOKEN_SECRET"]
                          })


class SuggestionsController < ApplicationController

  def index
    @user = User.find_by(uid: session[:user_id])
    @suggestions = TakeoutTunesWrapper.top(20)["suggestions"]

    render :index
  end
  
  def yelp_hash(pair_id)
    business_hash = client.business(TakeoutTunesWrapper.food_id(pair_id))
  end


  def show
    # this method needs to use the TakeoutTunes wrapper to get some suggestion pairs.
    # then it needs to deliver them to the suggestion partial, one at a time.
    @suggestions = TakeoutTunesWrapper.search()
  end

  private

end
