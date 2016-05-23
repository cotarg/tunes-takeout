require 'HTTParty'
require 'TakeoutTunesWrapper'




class SuggestionsController < ApplicationController


  def index
    @user = User.find_by(uid: session[:user_id])
    @suggestions = TakeoutTunesWrapper.top(21)["suggestions"]

    render :index

  end

  def search
    # this method needs to use the TakeoutTunes wrapper to get some suggestion pairs.
    # then it needs to deliver them to the suggestion partial, one at a time.
    @suggestions = TakeoutTunesWrapper.search(params[:search_results][:search])
    redirect_to root_path
  end

  private

  def suggestion_search_params
    params.permit(search_results: [:search])
  end

end
