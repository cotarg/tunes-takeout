require 'HTTParty'

class SuggestionsController < ApplicationController
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"


  def index
    @user = User.find_by(uid: session[:user_id])
    @suggestions = HTTParty.get(BASE_URL + "/v1/suggestions/top").parsed_response
    raise

    render :index
  end

  def show
    # this method needs to use the TakeoutTunes wrapper to get some suggestion pairs.
    # then it needs to deliver them to the suggestion partial, one at a time.
    @suggestions = TunesTakeoutWrapper.search()
  end

end
