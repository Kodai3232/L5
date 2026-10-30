class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    current_user&.like(tweet)
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    current_user&.unlike(tweet)
    redirect_to root_path
  end
end