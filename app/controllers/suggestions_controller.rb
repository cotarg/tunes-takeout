class SuggestionsController < ApplicationController

  def index
    @user = User.find_by(uid: session[:user_id])
    render :index
  end
  
end
